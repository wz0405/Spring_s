package spring.day0625.anno2;

import org.springframework.stereotype.Component;

@Component
public class KoreaTire implements Tire {

    @Override
    public String getTire() {

        return "한국금호타이어";
    }

}
