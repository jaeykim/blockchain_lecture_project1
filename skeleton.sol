pragma solidity >=0.4.22 <0.7.0;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract Ballot {
   
    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted;  // if true, that person already voted
        address[] delegates; // people delegated to
        uint[] votes;   // indices of the voted proposals
    }

    struct Proposal {
        // If you can limit the length to a certain number of bytes, 
        // always use one of bytes1 to bytes32 because they are much cheaper
        bytes32 name;   // short name (up to 32 bytes)
        uint256 voteCount; // number of accumulated votes
    }

    mapping(address => Voter) private _voters;

    Proposal[] private _proposals;

    /** 
     * @dev Create a new ballot to choose one of 'proposalNames'.
     * @param proposalNames names of proposals
     */
    constructor(bytes32[] memory proposalNames) public {
        for (uint i = 0; i < proposalNames.length; i++) {
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            _proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }
    
    /** 
     * @dev A voter gets the right to vote on this ballot according to its value.
     */
    function getRightToVote() public {
       // write code here
    }

    /**
     * @dev Delegate part of your vote to the voter 'to'.
     * @param to address to which vote is delegated
     * @param amount that you want to delegate
     */
    function delegate(address[] memory to, uint256[] memory amount) public {
        // write code here
    }

    /**
     * @dev Give your vote (including votes delegated to you) to proposals 'proposals[proposals[i]].name'.
     * @param proposals indices of proposals in the proposals array
     */
    function vote(uint[] memory proposals, uint256[] memory amounts) public {
        // write code here
    }

    /** 
     * @dev Computes the winning proposal taking all previous votes into account.
     * @return winningProposal_ index of winning proposal in the _proposals array
     */
    function winningProposal() public view returns (uint winningProposal_)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < _proposals.length; p++) {
            if (_proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = _proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    /** 
     * @dev Calls winningProposal() function to get the index of the winner contained in the _proposals array and then
     * @return winnerName_ the name of the winner
     */
    function winnerName() public view returns (bytes32 winnerName_)
    {
        winnerName_ = _proposals[winningProposal()].name;
    }
}
