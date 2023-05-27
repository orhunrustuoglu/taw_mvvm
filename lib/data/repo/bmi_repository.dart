class BmiRepository {
  double setBmi(int weight, height, age) {
    double bmi = (10 * weight) + (6.25 * height) - (5 * age) + 5; //male
    return bmi;
  }
}
