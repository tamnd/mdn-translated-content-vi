---
title: "Navigation: thuộc tính activation"
short-title: activation
slug: Web/API/Navigation/activation
page-type: web-api-instance-property
browser-compat: api.Navigation.activation
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`activation`** của giao diện {{domxref("Navigation")}} trả về một đối tượng {{domxref("NavigationActivation")}} chứa thông tin về lần điều hướng xuyên tài liệu gần nhất, đã "kích hoạt" Document này. Thuộc tính này sẽ không thay đổi trong khi điều hướng cùng tài liệu.

## Giá trị

Một đối tượng {{domxref("NavigationActivation")}}, hoặc `null` nếu tài liệu hiện tại là tài liệu `about:blank` ban đầu.

## Ví dụ

```js
if (navigation.activation) {
  console.log(navigation.activation.entry.url);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
