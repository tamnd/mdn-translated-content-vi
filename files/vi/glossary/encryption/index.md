---
title: Mã hóa
slug: Glossary/Encryption
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong {{glossary("cryptography","mật mã học")}}, **mã hóa** (encryption) là việc chuyển đổi {{glossary("plaintext","văn bản thuần túy")}} thành văn bản được mã hóa hay {{glossary("ciphertext","văn bản mã hóa")}}. Văn bản mã hóa được thiết kế để không thể đọc được bởi những người đọc không được phép.

Mã hóa là một nguyên thủy mật mã: nó biến đổi một thông điệp văn bản thuần túy thành văn bản mã hóa bằng cách sử dụng một thuật toán mật mã gọi là {{glossary("cipher","mật mã")}}. Mã hóa trong các mật mã hiện đại được thực hiện bằng cách sử dụng một thuật toán cụ thể và một bí mật, được gọi là {{glossary("key","khóa")}}. Vì thuật toán thường được công khai, khóa phải được giữ bí mật để mã hóa vẫn an toàn.

![Cách mã hóa hoạt động.](encryption.png)

Nếu không biết bí mật, thao tác ngược lại, {{glossary("decryption","giải mã")}}, rất khó thực hiện về mặt toán học. Độ khó phụ thuộc vào tính bảo mật của thuật toán mật mã được chọn và phát triển theo tiến trình nghiên cứu của {{glossary("cryptanalysis","phân tích mật mã")}}.
