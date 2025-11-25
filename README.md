# 🔗 Connected Smart Contracts: Inter-Contract Communication & Auth Patterns

Continuing my **Master in Blockchain Development** at **Blockchain Accelerator Academy**, this project explores **Composability** and advanced **Authentication Patterns** in the EVM.

As a **Java Software Engineer**, I am accustomed to building decoupled systems. In this project, I applied **Modular Architecture** principles to Solidity, creating a system where contracts interact via interfaces while maintaining secure access control across the call chain.

## 💡 Project Overview

The system creates a clear separation of concerns between Logic and Storage:

1.  **`Result.sol` (The Database):** Stores the state and permission logic.
2.  **`Adder.sol` (The Controller):** Executes the addition logic and calls `Result` to save data.
3.  **`IResult.sol` (The Interface):** Defines the contract ABI, acting as the bridge between Logic and Storage.

### 🔍 Key Technical Features:

* **Modular Architecture:**
    * Instead of a monolithic contract, I separated the system into layers. `Adder.sol` handles the calculation (Logic), while `Result.sol` handles the persistence (Storage). This mimics the separation of concerns often seen in backend development.

* **Global Transaction Origin (`tx.origin`):**
    * I implemented authentication using `tx.origin` instead of the standard `msg.sender`.
    * **The Problem:** When `Adder` calls `Result`, the `msg.sender` seen by `Result` is the `Adder` contract address, not the Admin's wallet. This would normally block the Admin from executing restricted functions through the logic contract.
    * **The Solution:** By checking `tx.origin` in the `onlyAdmin` modifier, the Storage contract verifies who *initiated* the transaction chain. This allows the Admin to execute functions (like `setFee`) via the `Adder` contract without losing privileges.

* **Interface-Based Interaction:**
    * Usage of `IResult(address)` to decouple the implementation from the definition, allowing the `Adder` contract to interact with any contract that adheres to the `IResult` structure.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Architecture:** Modular (Logic/State separation)
* **Security Patterns:** `tx.origin` for ownership validation in call chains.
* **License:** LGPL-3.0-only

---

*This project demonstrates how to maintain identity context and security across a chain of smart contract interactions.*
