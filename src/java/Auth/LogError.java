package Auth;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.logging.FileHandler;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LogError {

    private Logger logger;
    private FileHandler fh;

    public LogError(String fileName) {
        try {
            String directoryPath = "logs";
            File logDir = new File(directoryPath);
            if (!logDir.exists()) {
                logDir.mkdirs();
            }
            String fullPath = directoryPath + File.separator + fileName;

            // Create log file if it doesn't exist
            File logFile = new File(fullPath);
            if (!logFile.exists()) {
                logFile.createNewFile();
            }
            System.out.println("Log file created at: " + logFile.getAbsolutePath());
            // Initialize logger
            this.fh = new FileHandler(fullPath, true);
            this.logger = Logger.getLogger(LogError.class.getName());
            this.logger.addHandler(fh);
            fh.setFormatter(new CustomFormatter());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    public void logException(Exception e) {
        logger.severe("=== EXCEPTION ===");
        logger.severe("Type: " + e.getClass().getName());
        logger.severe("Message: " + e.getMessage());

        // Log stack trace
        logger.severe("Stack Trace:");
        for (StackTraceElement element : e.getStackTrace()) {
            logger.severe("\t" + element.toString());
        }

        // Log cause if exists
        if (e.getCause() != null) {
            logger.severe("Caused by: " + e.getCause().toString());
        }
    }

    public void logObject(Object obj) {
        if (obj == null) {
            logger.warning("Attempted to log null object");
            return;
        }

        logger.info("=== OBJECT DUMP ===");
        logger.info("Type: " + obj.getClass().getName());

        try {
            Field[] fields = obj.getClass().getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String name = field.getName();
                Object value = field.get(obj);
                logger.info(String.format("%s: %s", name, value != null ? value : "null"));
            }
        } catch (IllegalAccessException e) {
            logger.warning("Failed to access object fields: " + e.getMessage());
        }
    }

    public void close() {
        if (fh != null) {
            fh.close();
        }
    }
    private static class CustomFormatter extends Formatter {
        @Override
        public String format(LogRecord record) {
            return record.getLevel() + ": " + formatMessage(record) + "\n";
        }
    }
}
