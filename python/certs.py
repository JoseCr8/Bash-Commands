import base64
import os
import subprocess
import logging

_logger = logging.getLogger("certs")

def config_certs():
    """Gets the certificates and generates the necessary files"""
    # get base64 CA chain
    base64_ca_cert = os.getenv('CA_CERT')  
    # decode to binary
    bytes_ca_cert = base64.b64decode(base64_ca_cert)
    ca_path = "/usr/local/share/ca-certificates/ca.crt"
    with open(ca_path, 'wb') as f:
        f.write(bytes_ca_cert)
        
    try:
        subprocess.run(["update-ca-certificates"])
        _logger.info("AppConfig::Added ca.crt as trusted CA")

    except Exception as excplog:
        _logger.error(excplog)

    # get base64 Server Cert chain
    base64_app_cert = os.getenv('APP_CERT')  
    # decode to binary
    bytes_app_cert = base64.b64decode(base64_app_cert)
    app_cert_path = '/app_cert.pem'
    with open(app_cert_path, 'wb') as f:
        f.write(bytes_app_cert)

    _logger.info("AppConfig::Added app_cert.pem")

    # get base64 Server key chain
    base64_key = os.getenv('APP_KEY')  
    # decode to binary
    bytes_key = base64.b64decode(base64_key)
    key_path = '/cert_key.key'
    with open(key_path, 'wb') as f:
        f.write(bytes_key)

    _logger.info("AppConfig::Added cert_key.key")
