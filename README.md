# 팀 프로젝트 1
Due: 2020/10/23 17:00


> 이번 프로젝트는 각 팀별로 진행합니다. 시험 기간이라 힘드시겠지만, Solidity code를 빠른 시간 내에 이해하지 못하면 다음 단계로 진행할 수 없으므로 부득이 프로젝트를 진행합니다.

## 1. 목표
예제 코드로 제공되는 Ballot.sol 파일은 chairperson이 voter에게 1만큼의 투표 권한을 주는 컨트랙트이다. 하지만, chairperson이 투표할 수 있는 권한을 주는 것은 chariperson에게 권력이 집중되어 있는 형태이므로 검열이나 매표 행위 등을 통해 chairperson이 투표를 조작할 수 있다. 따라서 이러한 행위를 방지하기 위해 각 투표자가 이더리움을 소비하여 투표를 할 수 있는 시스템을 만들어보자.

## 2. 구현 스펙
본 프로젝트는 skeleton.sol 파일에 있는 세 가지 함수를 구현하면 된다. 단, 프로젝트에 제공되는 코드는 기존의 Ballot.sol 코드와 달라진 부분들이 있으므로 유의하여 작성하도록 한다.

**1. getRightToVote function**   
이전에는 chairperson이 vote 권한을 주었지만(give) 새로 구현하는 Ballot 컨트랙트에서는 투표자가 이더리움을 전송하고, 전송한 만큼 투표권(weight)을 받는 getRightToVote를 구현해야 한다.
*힌트: msg.value*

**2. delegate function**   
투표자가 원하는 사람(to)에게 투표권을 나눠주는 함수이다. 기존 Ballot 컨트랙트와의 차이점은 투표자가 여러 명의 사람에게 원하는 만큼만큼 투표권을 각각 나눠줄 수 있다는 것이다. 이 때, 모든 투표권을 소진하게 되었을 때가 되어서야 더 이상 투표를 하지 못하므로 voted가 True가 되어야 한다.

**3. vote function**   
Vote 함수에서 투표자는 원하는 proposal들에 원하는 만큼(amount) 투표권을 행사할 수 있다. 기존 Ballot 컨트랙트와의 차이점은 투표권이 모두 소진되었을 때 voted를 True로 바꿔줘야 한다는 것이다. 즉, 한 사람이 투표권이 모두 소진될 때까지 vote 함수를 계속해서 호출할 수 있다.

## 3. 테스트 방법
**(Bytes32 타입의 parameter를 입력하는 방법)** Remix의 console창에 다음과 같이 입력 후 bytes32 값을 얻는다.
```
web3.utils.fromAscii("Blockchain is a financial system")
web3.utils.fromAscii("Blockchain is a notarial system.")
web3.utils.fromAscii("Blockchain is a storage system..")
```

이렇게 얻은 bytes32 값을 이용하여 constructor의 파라미터를 다음과 같이 입력하면 테스트를 진행할 수 있다.

```
["0x426c6f636b636861696e20697320612066696e616e6369616c2073797374656d", "0x426c6f636b636861696e2069732061206e6f74617269616c2073797374656d2e", "0x426c6f636b636861696e20697320612073746f726167652073797374656d2e2e"]
```

## 4. 제출 방법 (Q & A)
skeleton.sol 파일을 베이스로 작성한 *1)Capital_ballot.sol 파일*과 함께 *2)수행한 테스트에 대한 내용을 담은 문서*를 함께 다음 이메일 주소(<jaeykim@altair.snu.ac.kr>)로 전송한다.
이 때 테스트는 프로젝트에서 원하는 동작들을 수행하는 것을 보여줄 수 있는 범위 내에서 재량껏 설계할 수 있다.

