resource "aws_instance" "k8s_host" {
  ami           = "ami-068c0051b15cdb816"
  instance_type = "t3.medium"
  key_name      = "your-key"
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]


  iam_instance_profile = aws_iam_instance_profile.profile.name

  user_data = <<-EOF
    #!/bin/bash
    set -e

    yum update -y

    # Docker
    yum install -y docker
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user

    # AWS CLI
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    unzip awscliv2.zip
    ./aws/install

    # kubectl
    curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    mv kubectl /usr/local/bin/

    # KIND
    curl -Lo kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
    chmod +x kind
    mv kind /usr/local/bin/
  EOF

  tags = {
    Name = "kind-k8s-host"
  }
}

