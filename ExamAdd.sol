// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ExamRegistration {
    struct Exam {
        uint id;
        string name;
        string description;
        uint ageMin;
        uint ageMax;
        string educationLevel;
        string eligibleColleges; // Comma-separated list
    }

    mapping(uint => Exam) public exams;
    uint public examCount = 0;

    event ExamCreated(uint examId, string name);

    // Add new exam
    function addExam(
        string memory _name,
        string memory _description,
        uint _ageMin,
        uint _ageMax,
        string memory _educationLevel,
        string memory _eligibleColleges
    ) public {
        examCount++;
        exams[examCount] = Exam(examCount, _name, _description, _ageMin, _ageMax, _educationLevel, _eligibleColleges);
        emit ExamCreated(examCount, _name);
    }

    // Get exam details by ID
    function getExam(uint _examId) public view returns (
        uint, string memory, string memory, uint, uint, string memory, string memory
    ) {
        Exam memory exam = exams[_examId];
        return (
            exam.id,
            exam.name,
            exam.description,
            exam.ageMin,
            exam.ageMax,
            exam.educationLevel,
            exam.eligibleColleges
        );
    }
}
