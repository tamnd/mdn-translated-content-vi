---
title: CookieChangeEvent
slug: Web/API/CookieChangeEvent
page-type: web-api-interface
browser-compat: api.CookieChangeEvent
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}

Giao diện **`CookieChangeEvent`** của {{domxref("Cookie Store API", "", "", "nocode")}} là kiểu sự kiện của sự kiện {{domxref("CookieStore/change_event", "change")}} được kích hoạt trên một {{domxref("CookieStore")}} khi có bất kỳ cookie nào được tạo hoặc xóa.

> [!NOTE]
> Một cookie bị thay thế do chèn một cookie khác có cùng tên, miền và đường dẫn sẽ bị bỏ qua và không kích hoạt sự kiện thay đổi.

{{InheritanceDiagram}}

## Constructor

- {{domxref("CookieChangeEvent.CookieChangeEvent", "CookieChangeEvent()")}}
  - : Tạo một `CookieChangeEvent` mới.

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Event")}}._

- {{domxref("CookieChangeEvent.changed")}} {{ReadOnlyInline}}
  - : Một mảng liệt kê tất cả cookie mới được tạo. Lưu ý rằng mảng này không bao gồm các cookie được tạo với ngày hết hạn trong quá khứ, vì các cookie đó sẽ bị xóa ngay lập tức.
- {{domxref("CookieChangeEvent.deleted")}} {{ReadOnlyInline}}
  - : Một mảng liệt kê tất cả cookie đã bị xóa, hoặc do hết hạn hoặc do bị xóa tường minh. Lưu ý rằng mảng này sẽ bao gồm các cookie được tạo với ngày hết hạn trong quá khứ.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ {{domxref("Event")}}._

## Ví dụ

Trong ví dụ này, khi cookie được đặt, bộ lắng nghe sự kiện sẽ ghi sự kiện ra bảng điều khiển. Đây là một đối tượng `CookieChangeEvent` với thuộc tính {{domxref("CookieChangeEvent.changed","changed")}} chứa một đối tượng đại diện cho cookie vừa được đặt.

```js
cookieStore.addEventListener("change", (event) => {
  console.log(event);
});

const oneDay = 24 * 60 * 60 * 1000;
cookieStore.set({
  name: "cookie1",
  value: "cookie1-value",
  expires: Date.now() + oneDay,
  domain: "example.com",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
