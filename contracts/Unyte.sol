// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Unyte {

    struct Task {
        uint256 taskId;
        string teamId;
        string teamName;
        string teamIconURL;
        string userId;
        string userName;
        string userIconURL;
        string content;
        bool completed;
    }

    struct Thank {
        uint256 taskId;
        string from;
        string fromName;
        string fromIconURL;
        string to;
        string toName;
        string toIconURL;
        string content;
    }
    

    mapping(uint256 => Task) public tasks;
    uint public taskCount;

    mapping(uint256 => Thank) public thanks;
    uint public thanksCount;



    
    event TaskAdded(uint256 taskId, string content);

    function addTask(string memory teamId, string memory teamName, string memory teamIconURL, string memory userId, string memory userName, string memory userIconURL, string memory content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, teamId, teamName, teamIconURL, userId, userName, userIconURL, content, false);
        emit TaskAdded(taskCount, content);
    }

    event TaskCompleted(uint256 taskId);

    function completeTask(uint256 taskId) public {
        Task storage task = tasks[taskId];
        task.completed = true;
        emit TaskCompleted(taskId);
    }

    function getAllTasks() public view returns (Task[] memory) {
        Task[] memory allTasks = new Task[](taskCount);
        for (uint256 i = 1; i <= taskCount; i++) {
            allTasks[i - 1] = tasks[i];
        }
        return allTasks;
    }




    event ThankAdded(uint256 taskId, string from, string to, string content);

    function addThank(uint256 taskId, string memory from, string memory fromName, string memory fromIconURL, string memory to, string memory toName, string memory toIconURL, string memory content) public {
        thanksCount++;
        thanks[thanksCount] = Thank(taskId, from, fromName, fromIconURL, to, toName, toIconURL, content);
        emit ThankAdded(taskId, from, to, content);
    }

    function getAllThanks() public view returns (Thank[] memory) {
        Thank[] memory allThanks = new Thank[](thanksCount);
        for (uint256 i = 1; i <= thanksCount; i++) {
            allThanks[i - 1] = thanks[i];
        }
        return allThanks;
    }
}
