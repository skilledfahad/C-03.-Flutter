abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount){
    balance-=amount;
  }
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    balance -= amount;
    balance += balance * interestRate;
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance - amount  >= overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

// ++++Use++++

void  main(){
 SavingsAccount my_saving_account=SavingsAccount(0012021020, 1000, 0.05);

 my_saving_account.deposit(500);
 print("My saving Account ${my_saving_account.accountNumber}; Balance ${my_saving_account.balance}");

 my_saving_account.withdraw(500);
 print("My saving Account ${my_saving_account.accountNumber}; Balance ${my_saving_account.balance}");


 CurrentAccount my_current_account=CurrentAccount(0022021020, 5000, 500);
 print("My current Account ${my_current_account.accountNumber}; Balance ${my_current_account.balance}");

 my_current_account.withdraw(5000);
 print("My current Account ${my_current_account.accountNumber}; Balance ${my_current_account.balance}");

}