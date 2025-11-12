# __EC2 Instance Status Checker and Auto-Starter__

This Bash script provides a simple automation mechanism to check the state of a specific Amazon EC2 instance and automatically start it if its current state is stopped or pending.

🚀 How It Works

The script performs the following steps:

Defines the target INSTANCE_ID and REGION.

Queries the AWS EC2 service using the AWS CLI (describe-instances) to retrieve the current state (running, stopped, pending, etc.).

Checks the returned status against three conditional blocks:

If the status is running, it exits with a success message.

If the status is stopped or pending, it calls aws ec2 start-instances to immediately initiate the startup process.

Otherwise (e.g., terminated, shutting-down), it reports an unexpected status and takes no action.

🛠️ Prerequisites

To use this script, you must have the following installed and configured on the system where you run it:

AWS Command Line Interface (AWS CLI): The primary tool used for interacting with the EC2 service.

AWS Credentials: The AWS CLI must be configured with credentials that have the necessary permissions (IAM Policy) to perform the following actions on the specified instance:

ec2:DescribeInstances

ec2:StartInstances

⚙️ Configuration

Before running the script, you must update the two variables at the top of the file to match your target instance.

INSTANCE_ID="i-04a4765fbacb8f06a" # <-- REPLACE with your EC2 Instance ID
REGION="us-east-1"               # <-- REPLACE with the region where the instance is located



Note: Although the REGION variable is defined, the AWS CLI usually determines the region from your environment or configured profile. However, it's best practice to keep it correct for clarity.

▶️ Execution

Save the code below as a file (e.g., ec2_status_check.sh).

Grant execution permissions to the script:

chmod +x ec2_status_check.sh



Run the script:

./ec2_status_check.sh


