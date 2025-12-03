package tn.cnss.cooperation.payment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.cnss.cooperation.payment.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
}
