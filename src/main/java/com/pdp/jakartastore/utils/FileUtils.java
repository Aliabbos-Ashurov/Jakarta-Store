package com.pdp.jakartastore.utils;

import jakarta.servlet.http.Part;
import lombok.NonNull;

/**
 * Utility class for file operations.
 *
 * @author Aliabbos Ashurov
 * @since 07/July/2024  16:09
 */
public class FileUtils {

    // salom

    /**
     * Generates a unique name for a file based on the current timestamp and original file name.
     *
     * @param originalFileName The original file name.
     * @return A unique file name string.
     */
    public static String generateUniqueName(@NonNull String originalFileName) {
        return System.currentTimeMillis() + "." + (originalFileName);
    }

    /**
     * Generates a unique name for a file based on the submitted part.
     *
     * @param part The Part object representing the file upload.
     * @return A unique file name string.
     */
    public static String generateUniqueName(@NonNull Part part) {
        return generateUniqueName(part.getSubmittedFileName());
    }

    /**
     * Retrieves the file type (extension) from a given file name.
     *
     * @param fileName The file name from which to extract the file type.
     * @return The file type (extension) string.
     */
    public static String getFileType(@NonNull String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}
