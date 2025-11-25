# 🔗 Connected Smart Contracts: Modular Architecture & Security Patterns

A reference implementation of composable smart contract architecture, focusing on the separation of **Logic** and **Storage** layers while enforcing secure cross-contract authentication.

## 🚀 Engineering Context

As a **Java Software Engineer**, building decoupled systems using Interfaces and Dependency Injection is standard practice to ensure maintainability. In **Solidity**, this concept translates to **Composability**, but introduces unique security challenges regarding identity propagation.

This project applies **Modular Architecture** principles to the EVM, demonstrating how to decouple Business Logic (`Adder`) from Persistence (`Result`) using strictly defined ABIs, while navigating the security nuances of call chains.

## 💡 Project Overview

The system architecture implements a separation of concerns pattern:

1.  **Persistence Layer (`Result.sol`):** Acts as the database, holding state and permission logic.
2.  **Logic Layer (`Adder.sol`):** Acts as the controller, executing arithmetic logic and interacting with the persistence layer.
3.  **Abstraction Layer (`IResult.sol`):** Defines the Interface (ABI), enabling loose coupling between components.

### 🔍 Key Technical Features:

* **Security & Phishing Mitigation (`msg.sender` vs `tx.origin`):**
    * **Threat Model:** While `tx.origin` is convenient for authorizing the original transaction signer across multiple calls, it introduces a critical **Phishing Vulnerability** (contracts can be tricked into acting on behalf of a user via a malicious intermediary).
    * **Architecture Decision:** I implemented a **Zero Trust** security model relying strictly on `msg.sender`. The Storage contract explicitly authorizes the Logic contract's address, ensuring that access is granted based on *immediate caller identity*, effectively neutralizing phishing vectors.

* **Interface-Based Interaction:**
    * Utilization of `IResult(address)` to decouple implementation from definition. The `Adder` contract interacts with `Result` purely through its interface. This pattern is the precursor to upgradeable proxy patterns, allowing logic to change without altering the interface or storage structure.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`.
* **Architecture:** Modular (Logic/Storage Separation).
* **Security:** Access Control, Phishing Prevention (CWE-115 Mitigation).
* **License:** LGPL-3.0-only.

---

*This project demonstrates how to maintain system modularity without compromising the security of the call stack.*