---
title: StyleSheetList
slug: Web/API/StyleSheetList
page-type: web-api-interface
browser-compat: api.StyleSheetList
---

{{APIRef("CSSOM")}}

Giao diện `StyleSheetList` đại diện cho danh sách các đối tượng {{domxref("CSSStyleSheet")}}. Một instance của đối tượng này có thể được trả về bởi {{domxref("Document.styleSheets")}}.

Đây là đối tượng dạng mảng nhưng không thể được lặp lại bằng các phương thức {{jsxref("Array")}}. Tuy nhiên, nó có thể được lặp lại trong vòng lặp {{jsxref("Statements/for", "for")}} tiêu chuẩn qua các chỉ mục của nó, hoặc được chuyển đổi thành {{jsxref("Array")}}.

> [!NOTE]
> Thông thường các giao diện danh sách như `StyleSheetList` bọc xung quanh các kiểu {{jsxref("Array")}}, vì vậy bạn có thể sử dụng các phương thức `Array` trên chúng.
> Đây không phải là trường hợp ở đây vì [lý do lịch sử](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156). Tuy nhiên, bạn có thể chuyển đổi `StyleSheetList` thành `Array` để sử dụng những phương thức đó (xem ví dụ dưới đây).

## Thuộc tính phiên bản

- {{domxref("StyleSheetList.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng đối tượng {{domxref("CSSStyleSheet")}} trong bộ sưu tập.

## Phương thức phiên bản

- {{domxref("StyleSheetList.item()")}}
  - : Trả về đối tượng {{domxref("CSSStyleSheet")}} tại chỉ mục được truyền vào, hoặc `null` nếu không có item nào tồn tại cho chỉ mục đó.

## Ví dụ

### Lấy đối tượng CSSStyleSheet với vòng lặp for

```js
for (const styleSheet of document.styleSheets) {
  console.log(styleSheet); // Một đối tượng CSSStyleSheet
}
```

### Lấy tất cả quy tắc CSS cho tài liệu bằng phương thức Array

```js
const allCSS = [...document.styleSheets]
  .map((styleSheet) => {
    try {
      return [...styleSheet.cssRules].map((rule) => rule.cssText).join("");
    } catch (e) {
      console.log(
        "Truy cập stylesheet %s bị từ chối. Bỏ qua…",
        styleSheet.href,
      );
      return undefined;
    }
  })
  .filter(Boolean)
  .join("\n");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
