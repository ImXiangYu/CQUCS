package com.example.maventest;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

public class RSA {
    private BigInteger n;          // 模数
    private BigInteger e;          // 公钥指数
    private BigInteger d;          // 私钥指数
    private BigInteger phi;        // 欧拉函数值φ(n)
    private int bitLength = 1024;  // 密钥位数

    // 构造函数，生成密钥对
    public RSA() {
        Random random = new SecureRandom();

        // 第一步：随机选择两个不相等的质数p和q
        BigInteger p = BigInteger.probablePrime(bitLength / 2, random);
        BigInteger q = BigInteger.probablePrime(bitLength / 2, random);

        // 第二步：计算p和q的乘积n
        n = p.multiply(q);

        // 第三步：计算n的欧拉函数φ(n) = (p-1)(q-1)
        phi = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));

        // 第四步：选择一个整数e，1 < e < φ(n)，且e与φ(n)互质
        e = BigInteger.probablePrime(bitLength / 2, random);
        while (e.compareTo(phi) >= 0 || !e.gcd(phi).equals(BigInteger.ONE)) {
            e = BigInteger.probablePrime(bitLength / 2, random);
        }

        // 第五步：计算e对于φ(n)的模反元素d
        d = e.modInverse(phi);
    }

    // 获取公钥 (n, e)
    public PublicKey getPublicKey() {
        return new PublicKey(n, e);
    }

    // 获取私钥 (n, d)
    public PrivateKey getPrivateKey() {
        return new PrivateKey(n, d);
    }

    // 加密方法
    public static byte[] encrypt(byte[] message, PublicKey publicKey) {
        return (new BigInteger(message)).modPow(publicKey.getE(), publicKey.getN()).toByteArray();
    }

    // 解密方法
    public static byte[] decrypt(byte[] encrypted, PrivateKey privateKey) {
        return (new BigInteger(encrypted)).modPow(privateKey.getD(), privateKey.getN()).toByteArray();
    }

    // 公钥类
    public static class PublicKey {
        private BigInteger n;
        private BigInteger e;

        public PublicKey(BigInteger n, BigInteger e) {
            this.n = n;
            this.e = e;
        }

        public BigInteger getN() {
            return n;
        }

        public BigInteger getE() {
            return e;
        }
    }

    // 私钥类
    public static class PrivateKey {
        private BigInteger n;
        private BigInteger d;

        public PrivateKey(BigInteger n, BigInteger d) {
            this.n = n;
            this.d = d;
        }

        public BigInteger getN() {
            return n;
        }

        public BigInteger getD() {
            return d;
        }
    }

    // 测试方法
    public static void main(String[] args) {
        RSA rsa = new RSA();

        String testString = "CQUINFORMATIONSECURITYEXP1";
        System.out.println("原始字符串: " + testString);

        byte[] encrypted = encrypt(testString.getBytes(), rsa.getPublicKey());
        System.out.println("加密后: " + Base64.getEncoder().encodeToString(encrypted));

        byte[] decrypted = decrypt(encrypted, rsa.getPrivateKey());
        System.out.println("解密后: " + new String(decrypted));
    }
}
