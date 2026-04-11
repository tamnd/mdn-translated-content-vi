---
title: "Navigation: phương thức entries()"
short-title: entries()
slug: Web/API/Navigation/entries
page-type: web-api-instance-method
browser-compat: api.Navigation.entries
---

{{APIRef("Navigation API")}}

Phương thức **`entries()`** của
giao diện {{domxref("Navigation")}} trả về một mảng các đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho tất cả các mục lịch sử hiện có.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("NavigationHistoryEntry")}}.

### Ngoại lệ

Không có.

## Ví dụ

### Trả về số lượng mục trong lịch sử

```js
let numOfEntries = navigation.entries().length - 1;
```

### Nút quay lại thông minh

Nút "quay lại" do trang cung cấp có thể đưa bạn trở lại, kể cả sau khi tải lại, bằng cách kiểm tra các mục lịch sử trước đó:

```js
backButtonEl.addEventListener("click", () => {
  if (
    navigation.entries()[navigation.currentEntry.index - 1]?.url ===
    "/product-listing"
  ) {
    navigation.back();
  } else {
    // If the user arrived here in some other way
    // e.g. by typing the URL directly:
    navigation.navigate("/product-listing", { history: "replace" });
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
