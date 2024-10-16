# Bash-Parse-Logs

This project fetches raw web logs from a URL, saves them to a file, and processes the logs to extract specific information. The script identifies logs that contain the string `coderbyte heroku/router`, extracts the `request_id` and `fwd` values, and formats them as described below.

## Requirements

- Bash shell
- `curl` (for fetching the logs)
- Basic Unix tools like `grep`, `cut`, etc.

## How the Script Works

1. **Fetching the Logs**:
   - The script uses `curl` to fetch raw logs from the following URL:
 - 
     ```https://coderbyte.com/api/challenges/logs/web-logs-raw ```

   - These logs are saved to a file called `web_logs.txt`.

2. **Processing the Logs**:
   - The script reads through each line of the saved log file.
   - It filters lines containing the string `coderbyte heroku/router`.
   - For each matching line, the `request_id` and `fwd` values are extracted.
   - If the `fwd` value is `MASKED`, the output adds `[M]` after the `request_id`. Otherwise, the actual `fwd` value is displayed in the format `[fwd_value]`.

### Example Output

![Terminal Output](https://github.com/PreciousEddy/Bash-Parse-Logs/blob/main/Picture/Terminal%20Output.png)

## Script Usage

1. **Clone the Repository**:

   Clone the repository:

   ```git clone https://github.com/PreciousEddy/Bash-Parse-Logs.git```

2. **Make the Script Executable**:

   You need to make the script executable. Use the following command:
   ```nchmod +x SRE.sh ```

3. **Run the Script**:

    After making the script executable, you can run it directly:
    ```./SRE.sh```

4. **Logs Processing**:
      The Script will:

       * Fetch the raw logs from the URL
       * Save the logs into a file called "web_logs.txt"
       * Process the logs to find and output the required ```request_id``` and ```fwd``` values

--