# make file as we are not able to use ninja with modules

# Compiler settings
CC := clang
OPTIMIZATION := -O2
CFLAGS := -Wall -Wextra -fmodules-ts  -std:c++2b
LDFLAGS := 


# PROJECT STRUCTURE
SRC_DIR := .
BUILD_DIR := build
BIN_DIR := bin
TARGET := $(BIN_DIR)/my_executable


# CODE FILES
SRC_EXT := cpp
SOURCES := $(shell find $(SRC_DIR) -type f -name *.$(SRC_EXT))
# generate a list  the .cpp files into the build_dir *.o files
OBJECTS := $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SOURCES:.$(SRC_EST)=.o))
DEPS := $(OBJECTS:.o=.d)


# Implicit rule for object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.$(SRC_EXT)
	@mkdir -p $(@D) # Creat directory if needed
	$(CC) $(CFLAGS) -c $< -o $@ -MMD -MP # create dependency files and phony 

# Include dependencies
-include $(DEPS)

# Build target
$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	@echo "$(OBJECTS)"
	$(CC) $(LDFLAGS) $(CFLAGS) $(OBJECTS) -o $(TARGET)
	
# Phony rules
.PHONY: clean all

all: $(TARGET)

clean: 
	@echo "Cleaning....";
	@echo "rm -r $(BUILD_DIR) $(BIN_DIR)";

# Non-file targets
