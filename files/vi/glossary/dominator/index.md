---
title: Dominator
slug: Glossary/Dominator
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong lý thuyết đồ thị, node A **chi phối** node B nếu mọi đường đi từ node gốc đến B đều phải đi qua A.

Khái niệm này quan trọng đối với {{Glossary("garbage collection","thu gom rác")}} vì nó có nghĩa là B chỉ có thể truy cập được thông qua A. Vì vậy, nếu bộ thu gom rác phát hiện ra rằng A không thể truy cập được và đủ điều kiện để thu hồi, thì B cũng sẽ không thể truy cập được và đủ điều kiện để thu hồi. Vì vậy, các đối tượng mà A chi phối đóng góp vào kích thước được giữ lại của A: tức là tổng lượng bộ nhớ có thể được giải phóng nếu bản thân A được giải phóng.

## Xem thêm

- [Dominator](<https://en.wikipedia.org/wiki/Dominator_(graph_theory)>) trên Wikipedia
- [Dominators](https://firefox-source-docs.mozilla.org/devtools-user/memory/dominators/index.html)
- [Garbage collection](/en-US/docs/Web/JavaScript/Guide/Memory_management#garbage_collection)
