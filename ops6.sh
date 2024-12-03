#!/bin/bash
# Install whois on your Kali

# Add to your bash script a sixth option that calls a function to:

# Take a user input string. Presumably the string is a domain name such as Google.com.
# Run whois against a user input string.
# Run dig against the user input string.
# Run host against the user input string.
# Run nslookup against the user input string.
# Output the results to a single .txt file and open it with your favorite text editor.

# For this challenge you must use at least one variable and one function.

#!/bin/bash

# Function for option 6
perform_domain_analysis() {
    echo "Enter the domain name (e.g., google.com):"
    read -r domain

    # Check if the domain input is not empty
    if [[ -z "$domain" ]]; then
        echo "Domain name cannot be empty. Try again."
        return
    fi

    # Set the output file name
    output_file="${domain}_analysis.txt"

    echo "Performing analysis on $domain..."
    
    # Run commands and write output to the file
    {
        echo "WHOIS Results:"
        whois "$domain"
        echo
        echo "DIG Results:"
        dig "$domain"
        echo
        echo "HOST Results:"
        host "$domain"
        echo
        echo "NSLOOKUP Results:"
        nslookup "$domain"
    } > "$output_file"

    echo "Analysis completed. Results saved to $output_file."
    
    # Open the output file with the default text editor
    xdg-open "$output_file" 2>/dev/null || nano "$output_file"
}

# Menu-driven program
while true; do
    echo "Select an option:"
    echo "1. Option 1"
    echo "2. Option 2"
    echo "3. Option 3"
    echo "4. Option 4"
    echo "5. Option 5"
    echo "6. Domain Analysis"
    echo "7. Exit"
    read -r choice

    case $choice in
        1)
            echo "Option 1 selected."
            ;;
        2)
            echo "Option 2 selected."
            ;;
        3)
            echo "Option 3 selected."
            ;;
        4)
            echo "Option 4 selected."
            ;;
        5)
            echo "Option 5 selected."
            ;;
        6)
            perform_domain_analysis
            ;;
        7)
            echo "Exiting."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
