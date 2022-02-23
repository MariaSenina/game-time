package com.group9.gametime.beans;

public class Schedule {
    private boolean success;
    private Object data;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "success=" + success +
                ", data=" + data +
                '}';
    }
}
