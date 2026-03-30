---
title: Chế độ hoạt động mật mã khối
slug: Glossary/Block_cipher_mode_of_operation
page-type: glossary-definition
sidebar: glossarysidebar
---

**Chế độ hoạt động mật mã khối** (block cipher mode of operation), thường chỉ được gọi là "chế độ" trong ngữ cảnh, chỉ định cách thức mã khối nên được sử dụng để mã hóa hoặc giải mã các tin nhắn dài hơn kích thước khối.

Hầu hết các thuật toán khóa đối xứng hiện đang sử dụng là mã khối: điều này có nghĩa là chúng mã hóa dữ liệu từng khối một. Kích thước của mỗi khối là cố định và được xác định bởi thuật toán: ví dụ AES sử dụng các khối 16 byte. Mã khối luôn được sử dụng với một _chế độ_, chỉ định cách mã hóa an toàn các tin nhắn dài hơn kích thước khối. Ví dụ, AES là một mã, trong khi CTR, CBC và GCM đều là các chế độ. Sử dụng chế độ không phù hợp hoặc sử dụng chế độ không đúng cách, có thể hoàn toàn phá vỡ tính bảo mật do mã cơ bản cung cấp.
