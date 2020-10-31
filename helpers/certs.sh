function genkey {
    openssl genrsa -out ${key_file:-"some.key"} ${key_size:-"4096"}
}

function gencert {
    key_file_arg=${key_file:-"some.key"}
    cert_file_arg=${cert_file:-"some.crt"}
    subj_arg=${subj:-"/C=EE/ST=Harju/L=Tallinn/O=Viktor Vlasov/OU=Viktor Vlasov/CN=localhost"}
    openssl req -new -x509 -key $key_file_arg -out $cert_file_arg -subj $subj_arg
}

function gencsr {
    key_arg=${key_file:-"some.key"}
    config_arg=${config_file:-"some.config"}
    csr_arg=${csr_file:-"some.csr"}
    openssl req -new -out $csr_arg -key $key_arg -config $config_arg
}

function gensigncert {
    csr_arg=${csr_file:-"cert-request.csr"}
    ca_cert_arg=${ca_cert_file:-"ca.crt"}
    ca_key_arg=${ca_key_file:-"ca.key"}
    cert_arg=${cert_file:-"some.crt"}
    openssl x509 -req -in $csr_arg -CA $ca_cert_arg -CAkey $ca_key_arg -CAcreateserial -out $cert_arg
}

function copy2p12 {
    key_file_arg=${key_file:-"some.key"}
    cert_file_arg=${cert_file:-"some.crt"}
    p12_file_arg=${p12_file:-"some.p12"}
    openssl pkcs12 -export -out $p12_file_arg -inkey $key_file_arg -in $cert_file_arg
}

function gencakey {
    key_file=ca.key genkey
}

function genserkey {
    key_file=server.key genkey
}

function genclikey {
    key_file=client.key genkey
}

function gencacert {
    key_file=ca.key cert_file=ca.crt gencert
}

function gensercsr {
    key_file=server.key config_file=server-csr.config csr_file=server.csr gencsr
}

function genclicsr {
    key_file=client.key config_file=client-csr.config csr_file=client.csr gencsr
}

function gensercrt {
    csr_file=server.csr ca_cert_file=ca.crt ca_key_file=ca.key cert_file=server.crt gensigncert
}

function genclicrt {
    csr_file=client.csr ca_cert_file=ca.crt ca_key_file=ca.key cert_file=client.crt gensigncert
}

function prepare_ssl_files {
    gencakey
    genserkey
    genclikey
    gencacert
    gensercsr
    genclicsr
    gensercrt
    genclicrt
}

function jks2p12 {
    keytool -importkeystore -srckeystore $1 -destkeystore $2 -deststoretype PKCS12
}

function get_p12_cert {
    openssl pkcs12 -in $1 -nokeys
}

function get_p12_key {
    openssl pkcs12 -in $1 -nocerts -nodes
}
