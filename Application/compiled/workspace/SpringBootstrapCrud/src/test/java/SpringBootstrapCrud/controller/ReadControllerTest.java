package SpringBootstrapCrud.controller;

import SpringBootstrapCrud.service.ReadService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ReadControllerTest {
    //Mockito unittest sample code
    public static final String DAVE = "Dave";
    @InjectMocks
    ReadController readController;

    @Mock
    ReadService readService;

    @Test
    public void shouldCallReadService() throws Exception {
        String expectedMessage = "Hi " + DAVE;
        when(readService.testRead2(DAVE)).thenReturn(expectedMessage);

        String actual = readController.testRead3(DAVE);
        assertEquals(expectedMessage, actual);
    }
}
