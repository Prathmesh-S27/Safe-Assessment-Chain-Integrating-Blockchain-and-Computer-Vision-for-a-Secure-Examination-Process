// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ExamSystem {
    struct Exam {
        uint id;
        string name;
        string description;
        uint ageMin;
        uint ageMax;
        string educationLevel;
        string eligibleColleges;
    }

    mapping(uint => Exam) public exams;
    uint public examCount;

    event ExamAdded(
        uint id,
        string name,
        string description,
        uint ageMin,
        uint ageMax,
        string educationLevel,
        string eligibleColleges
    );

    function addExam(
        string memory _name,
        string memory _description,
        uint _ageMin,
        uint _ageMax,
        string memory _educationLevel,
        string memory _eligibleColleges
    ) public {
        examCount++;
        exams[examCount] = Exam(
            examCount,
            _name,
            _description,
            _ageMin,
            _ageMax,
            _educationLevel,
            _eligibleColleges
        );
        emit ExamAdded(
            examCount,
            _name,
            _description,
            _ageMin,
            _ageMax,
            _educationLevel,
            _eligibleColleges
        );
    }

    function getExam(uint _id)
        public
        view
        returns (
            uint,
            string memory,
            string memory,
            uint,
            uint,
            string memory,
            string memory
        )
    {
        Exam memory e = exams[_id];
        return (
            e.id,
            e.name,
            e.description,
            e.ageMin,
            e.ageMax,
            e.educationLevel,
            e.eligibleColleges
        );
    }
}
