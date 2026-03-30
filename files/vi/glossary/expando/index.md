---
title: Expando
slug: Glossary/Expando
page-type: glossary-definition
sidebar: glossarysidebar
---

Thuộc tính expando là các thuộc tính được thêm vào các {{glossary("DOM")}} node bằng {{glossary("JavaScript")}}, trong đó các thuộc tính đó không phải là một phần của đặc tả {{glossary("object","đối tượng")}} DOM:

```js
window.document.foo = 5; // foo là expando
```

Thuật ngữ này cũng có thể được áp dụng cho các thuộc tính được thêm vào các đối tượng mà không tôn trọng ý định ban đầu của đối tượng, chẳng hạn như các thuộc tính tên không phải số được thêm vào một {{glossary("Array","Mảng")}}.
