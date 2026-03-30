---
title: Bộ mật mã
slug: Glossary/Cipher_suite
page-type: glossary-definition
sidebar: glossarysidebar
---

**Bộ mật mã** (Cipher suite) là sự kết hợp của thuật toán trao đổi khóa, phương pháp xác thực, {{Glossary("cipher", "mật mã")}} mã hóa khối lượng lớn và mã xác thực tin nhắn.

Trong một hệ thống mật mã như {{Glossary("TLS")}}, máy khách và máy chủ phải đồng ý về một bộ mật mã trước khi họ có thể bắt đầu giao tiếp an toàn. Một bộ mật mã điển hình trông như ECDHE_RSA_WITH_AES_128_GCM_SHA256 hoặc ECDHE-RSA-AES128-GCM-SHA256, cho biết:

- ECDHE (elliptic curve Diffie–Hellman ephemeral) để trao đổi khóa
- RSA để xác thực
- AES-128 là mật mã, với Galois/Counter Mode (GCM) là chế độ hoạt động mật mã khối
- SHA-256 là mã xác thực tin nhắn dựa trên hash (HMAC)

## Xem thêm

- [Lựa chọn bộ mật mã được Mozilla khuyến nghị cho TLS](https://wiki.mozilla.org/Security/Server_Side_TLS)
