# Todo-List-Manager-Script
Manage tasks directly from the terminal.

### How to Use the Script

1. **Save the script** as `todo_manager.sh` and make it executable:
   ```bash
   chmod +x todo_manager.sh
   ```

2. **Add a task**:
   ```bash
   ./todo_manager.sh add "Finish writing blog post"
   ```
   - Adds "Finish writing blog post" to the todo list.

3. **List tasks**:
   ```bash
   ./todo_manager.sh list
   ```
   - Displays all tasks with numbered list.

4. **Delete a task**:
   ```bash
   ./todo_manager.sh delete 2
   ```
   - Deletes the task at position 2 in the list.

5. **Clear all tasks**:
   ```bash
   ./todo_manager.sh clear
   ```
   - Removes all tasks from the list.

6. **Mark a task as priority**:
   ```bash
   ./todo_manager.sh priority 1
   ```
   - Moves task 1 to the top of the list and labels it as `[PRIORITY]`.

---

### Features
1. **Task Persistence**: Tasks are saved in a text file (`todo_list.txt`).
2. **Prioritization**: Easily mark important tasks.
3. **User-Friendly Output**: Lists tasks with line numbers for easy reference.
4. **Scalable**: Works with any number of tasks.
