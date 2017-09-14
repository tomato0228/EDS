package com.njust.eds.utils;

/**
 * @author tomato
 * @create 2017-09-14 下午1:35
 */
public class GraphicData {
    private int x;
    private int y;
    private int w;
    private int h;

    @Override
    public String toString() {
        return "GraphicData{" +
                "x=" + x +
                ", y=" + y +
                ", w=" + w +
                ", h=" + h +
                '}';
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getW() {
        return w;
    }

    public void setW(int w) {
        this.w = w;
    }

    public int getH() {
        return h;
    }

    public void setH(int h) {
        this.h = h;
    }
}
