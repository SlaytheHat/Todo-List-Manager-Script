#!/bin/bash

# Configuration
TODO_FILE="./todo_list.txt"  # File to store tasks

# Ensure the todo file exists
touch "$TODO_FILE"

# Function to display usage instructions
usage() {
    echo "Usage: $0 {add|list|delete|clear|priority} [arguments]"
    echo
    echo "Commands:"
    echo "  add <task>               Add a new task."
    echo "  list                     List all tasks."
    echo "  delete <task_number>     Delete a task by its number."
    echo "  clear                    Clear all tasks."
    echo "  priority <task_number>   Mark a task as high priority."
    echo
    exit 1
}

# Function to add a task
add_task() {
    local task=$1
    if [[ -z "$task" ]]; then
        echo "Error: No task provided."
        usage
    fi

    echo "$task" >> "$TODO_FILE"
    echo "Task added: $task"
}

# Function to list all tasks
list_tasks() {
    if [[ ! -s "$TODO_FILE" ]]; then
        echo "Your todo list is empty!"
        return
    fi

    echo "Your todo list:"
    nl -w2 -s'. ' "$TODO_FILE"  # Display tasks with line numbers
}

# Function to delete a task
delete_task() {
    local task_number=$1
    if [[ -z "$task_number" || ! "$task_number" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid task number."
        usage
    fi

    sed -i "${task_number}d" "$TODO_FILE"
    echo "Task $task_number deleted."
}

# Function to clear all tasks
clear_tasks() {
    > "$TODO_FILE"
    echo "All tasks cleared."
}

# Function to prioritize a task
prioritize_task() {
    local task_number=$1
    if [[ -z "$task_number" || ! "$task_number" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid task number."
        usage
    fi

    local task=$(sed -n "${task_number}p" "$TODO_FILE")
    if [[ -z "$task" ]]; then
        echo "Error: Task $task_number does not exist."
        exit 1
    fi

    sed -i "${task_number}d" "$TODO_FILE"
    echo "[PRIORITY] $task" | cat - "$TODO_FILE" > temp && mv temp "$TODO_FILE"
    echo "Task $task_number marked as high priority."
}

# Main script logic
if [[ $# -lt 1 ]]; then
    usage
fi

case $1 in
    add)
        shift
        add_task "$*"
        ;;
    list)
        list_tasks
        ;;
    delete)
        delete_task "$2"
        ;;
    clear)
        clear_tasks
        ;;
    priority)
        prioritize_task "$2"
        ;;
    *)
        usage
        ;;
esac
