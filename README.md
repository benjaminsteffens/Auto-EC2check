##  EC2 Instance Status Checker and Starter Script

This simple Bash script checks the operational status of a specific Amazon EC2 instance and automatically attempts to start it if the instance is currently stopped or pending.

---

##  Prerequisites

* **AWS CLI Installed:** The Amazon Web Services Command Line Interface (AWS CLI) must be installed on the machine running this script.
* **AWS CLI Configured:** Your AWS credentials must be configured for the CLI with the necessary permissions to perform the following actions:
    * `ec2:DescribeInstances`
    * `ec2:StartInstances`

---

##  Setup

1.  **Save the script:** Save the code into a file named, for example, `start_ec2_instance.sh`.
2.  **Make it executable:**
    ```bash
    chmod +x start_ec2_instance.sh
    ```
3.  **Update Variables:** Open the script and replace the placeholder values for `INSTANCE_ID` and `REGION` with your desired values.

    ```bash
    INSTANCE_ID="Your instance id" # <-- Update this
    REGION="specific region"     # <-- Update this
    # ... rest of the script
    ```
    > **Note:** The `REGION` variable is currently defined but **not used** in the AWS CLI commands within the script. If your AWS CLI is not configured with the correct default region, you should modify the `aws ec2` commands to explicitly include `--region $REGION`.

---

##  How to Run

Execute the script directly from your terminal:

```bash
./start_ec2_instance.sh


