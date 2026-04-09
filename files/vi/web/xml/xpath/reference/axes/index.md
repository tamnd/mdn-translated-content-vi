---
title: Các trục
slug: Web/XML/XPath/Reference/Axes
page-type: landing-page
sidebar: xmlsidebar
---

Có mười ba axis khác nhau trong đặc tả [XPath](/en-US/docs/Web/XML/XPath). Một axis biểu diễn một quan hệ với node ngữ cảnh, và được dùng để định vị các node tương đối với node đó trên cây.

Để biết thêm thông tin về việc dùng các biểu thức XPath, vui lòng xem hướng dẫn [Biến đổi XML bằng XSLT](/en-US/docs/Web/XML/XSLT/Guides/Transforming_XML_with_XSLT). Cũng xem phần ["axes" trong đặc tả XPath](https://www.w3.org/TR/xpath-3/#axes).

- `ancestor`
  - : Chỉ tất cả các tổ tiên của node ngữ cảnh, bắt đầu từ node cha và đi lên tới node gốc.
- `ancestor-or-self`
  - : Chỉ node ngữ cảnh và tất cả các tổ tiên của nó, bao gồm cả node gốc.
- `attribute`
  - : Chỉ các thuộc tính của node ngữ cảnh. Chỉ element mới có thuộc tính. Axis này có thể được viết tắt bằng ký hiệu at (`@`).
- `child`
  - : Chỉ các node con của node ngữ cảnh. Nếu một biểu thức XPath không chỉ định axis, đây là mặc định. Vì chỉ node gốc hoặc các node element mới có node con, mọi cách dùng khác sẽ chọn không có gì.
- `descendant`
  - : Chỉ tất cả các node con của node ngữ cảnh, và tất cả con của chúng, và tiếp tục như vậy. Các node thuộc tính và namespace **không** được bao gồm - `parent` của một node `attribute` là một node element, nhưng các node `attribute` không phải là con của parent của chúng.
- `descendant-or-self`
  - : Chỉ node ngữ cảnh và tất cả các hậu duệ của nó. Các node thuộc tính và namespace **không** được bao gồm - `parent` của một node `attribute` là một node element, nhưng các node `attribute` không phải là con của parent của chúng.
- `following`
  - : Chỉ tất cả các node xuất hiện sau node ngữ cảnh, ngoại trừ bất kỳ node `descendant`, `attribute` và `namespace` nào.
- `following-sibling`
  - : Chỉ tất cả các node có cùng parent với node ngữ cảnh và xuất hiện sau node ngữ cảnh trong tài liệu nguồn.
- `namespace` _(không được hỗ trợ)_
  - : Chỉ tất cả các node đang nằm trong phạm vi của node ngữ cảnh. Trong trường hợp này, node ngữ cảnh phải là một node element.
- `parent`
  - : Chỉ node đơn lẻ là parent của node ngữ cảnh. Nó có thể được viết tắt bằng hai dấu chấm (`..`).
- `preceding`
  - : Chỉ tất cả các node đứng trước node ngữ cảnh trong tài liệu, ngoại trừ các node `ancestor`, `attribute` và `namespace`.
- `preceding-sibling`
  - : Chỉ tất cả các node có cùng parent với node ngữ cảnh và xuất hiện trước node ngữ cảnh trong tài liệu nguồn.
- `self`
  - : Chỉ chính node ngữ cảnh. Nó có thể được viết tắt bằng một dấu chấm đơn (`.`).
