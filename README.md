# 🔗 Connected Smart Contracts: Inter-Contract Communication & Auth Patterns

Continuing my **Master in Blockchain Development** at **Blockchain Accelerator Academy**, this project explores **Composability** and advanced **Authentication Patterns** in the EVM.

As a **Java Software Engineer**, I am accustomed to managing complex call chains. In this project, I implemented a modular architecture where contracts interact via interfaces, and I tackled the challenge of identifying the *original* user across multiple contract calls.

## 💡 Project Overview

The system creates a separation of concerns between Logic and Storage:

1.  **`Result.sol` (The Database):** Stores the state and permission logic.
2.  **`Adder.sol` (The Controller):** executes the addition logic and calls `Result` to save data.
3.  **`IResult.sol` (The Interface):** Defines the contract ABI for interaction.

### 🔍 Key Technical Features:

* **Global Transaction Origin (`tx.origin`):**
    * [cite_start]I implemented authentication using `tx.origin` instead of `msg.sender`[cite: 4].
    * **The Problem:** When `Adder` calls `Result`, the `msg.sender` seen by `Result` is the `Adder` contract, not the Admin.
    * [cite_start]**The Solution:** By checking `tx.origin`, the `Result` contract verifies who *initiated* the transaction chain, allowing the Admin to execute restricted functions (like `setFee`) even when calling through the `Adder` contract[cite: 4, 28].
* [cite_start]**Interface-Based Interaction:** usage of `IResult(address)` to decouple implementation from definition[cite: 25, 28].
* [cite_start]**Modifiers for Access Control:** The `onlyAdmin` modifier acts as a guard, ensuring only the original transaction signer can alter sensitive state variables like `fee` or `admin`[cite: 4, 7, 9].

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Architecture:** Modular (Logic/State separation)
* **Security Concepts:** `tx.origin` vs `msg.sender`, Access Control.

---

*This project demonstrates how to maintain identity context across a chain of smart contract interactions.*
