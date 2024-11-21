# Rock-Paper-Scissors Bash Game  

## **Overview**  
This project is a terminal-based **Rock-Paper-Scissors** game implemented using Bash scripting. It offers users an engaging gameplay experience with persistent user records, win/loss ratio tracking, and a global leaderboard. Users can play against a computer opponent with moves chosen randomly, view their personal stats, or check a leaderboard ranking all players based on their performance. The leaderboard is dynamically updated via an automated cron job.

---

## **Features**  
- **User-Specific Records**:  
  Each user has a unique `.txt` file to store their game stats (wins, losses, and draws).  

- **Gameplay Mechanics**:  
  - Intuitive menu to play the game or view stats.  
  - Randomized computer moves ensure fairness.  

- **Win/Loss Ratio Tracking**:  
  View individual performance stats dynamically calculated from user-specific records.  

- **Leaderboard**:  
  - Displays all users ranked by win/loss ratio.  
  - Automatically updated via a scheduled cron job.  

- **Terminal-Based Interface**:  
  Fully functional within the terminal, ensuring simplicity and ease of use.  

---

## **Setup**  

### **Prerequisites**  
- Linux/Unix environment.  
- Basic knowledge of Bash scripting.  

### **Installation**  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/241111-Python/celso-p1.git 
   cd celso-p1 
   ```

### **Start the game**    
   ```bash 
   ./game_menu.sh
   ```
### **Optional**

### *Set up the cron job for leaderboard updates:* 
1. Open Cron:
    ```bash 
    crontab -e
    ```

2.    Add the following line to schedule the     leaderboard update script (adjust timing as needed):

        ```bash 
        * * * * * /path/to/leaderboard_updater.sh  
        ```


   