package ch.hftm.text_validator;

import javax.enterprise.context.ApplicationScoped;

import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.eclipse.microprofile.reactive.messaging.Outgoing;

import io.quarkus.logging.Log;
import io.smallrye.mutiny.Multi;

@ApplicationScoped
public class ValidatorService {

    public record ValidationRequest(long id, String text) {
    }

    public record ValidationResponse(long id, boolean valid) {
    }

    @Incoming("validation-request")
    @Outgoing("validation-response")
    public Multi<ValidationResponse> validateTextMessages(Multi<ValidationRequest> requests) {
        return requests
                .onItem().transform(request -> {
                    boolean valid = !request.text().contains("hftm sucks");
                    Log.info("Text-Validation processed: " + request.text() + " -> " + valid);
                    return new ValidationResponse(request.id(), valid);
                });
    }
}

