---
title: Mixin
slug: Glossary/Mixin
page-type: glossary-definition
sidebar: glossarysidebar
---

_Mixin_ là một {{Glossary("class")}} (giao diện, theo thuật ngữ của đặc tả WebAPI) trong đó một số hoặc tất cả {{Glossary("method", "phương thức")}} và/hoặc {{Glossary("property", "thuộc tính")}} của nó chưa được triển khai, yêu cầu một {{Glossary("class")}} hoặc {{Glossary("interface")}} khác cung cấp các triển khai còn thiếu.

Lớp hoặc giao diện mới sau đó sẽ bao gồm cả các thuộc tính và phương thức từ mixin cũng như những gì nó tự định nghĩa. Tất cả các phương thức và thuộc tính đều được sử dụng hoàn toàn giống nhau bất kể chúng được triển khai trong mixin hay trong giao diện hoặc lớp triển khai mixin.

Ưu điểm của mixin là chúng có thể được dùng để đơn giản hóa thiết kế các API trong đó nhiều giao diện cần bao gồm các phương thức và thuộc tính giống nhau.

Ví dụ, mixin `WindowOrWorkerGlobalScope` được sử dụng để cung cấp các phương thức và thuộc tính cần có mặt trên cả giao diện {{domxref("Window")}} và {{domxref("WorkerGlobalScope")}}. Mixin được triển khai bởi cả hai giao diện đó.

## Xem thêm

- [Mixin](https://en.wikipedia.org/wiki/Mixin) trên Wikipedia
