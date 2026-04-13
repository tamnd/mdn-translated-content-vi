---
title: "HTMLAnchorElement: thuộc tính relList"
short-title: relList
slug: Web/API/HTMLAnchorElement/relList
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.relList
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`relList`** của {{domxref("HTMLAnchorElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp chứa tập hợp các loại liên kết cho biết mối quan hệ giữa tài nguyên được đại diện bởi phần tử {{HTMLElement("a")}} và tài liệu hiện tại. Nó phản ánh thuộc tính nội dung [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) của phần tử {{HTMLElement("a")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `relList` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `relList`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}}, và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```js
const anchors = document.getElementsByTagName("a");
for (const anchor of anchors) {
  const list = anchor.relList;
  console.log(
    `Tìm thấy thẻ neo mới với ${list.length} loại liên kết trong relList.`,
  );
  list.forEach((relValue) => {
    console.log(relValue);
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính tương đương trên {{HTMLElement("area")}} và {{HTMLElement("link")}},
  {{domxref("HTMLAreaElement.relList")}} và {{domxref("HTMLLinkElement.relList")}}.
- Cùng danh sách đó nhưng dưới dạng token được phân tách bằng khoảng trắng trong một chuỗi:
  {{domxref("HTMLAnchorElement.rel")}}
