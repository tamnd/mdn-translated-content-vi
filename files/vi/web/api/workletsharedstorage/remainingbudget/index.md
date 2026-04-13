---
title: "WorkletSharedStorage: remainingBudget() method"
short-title: remainingBudget()
slug: Web/API/WorkletSharedStorage/remainingBudget
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WorkletSharedStorage.remainingBudget
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`remainingBudget()`** của giao diện {{domxref("WorkletSharedStorage")}} trả về ngân sách điều hướng còn lại cho nguồn gốc hiện tại.

Ngân sách điều hướng là số bit entropy được phép bên trong {{htmlelement("fencedframe")}} do các lệnh gọi {{domxref("WindowSharedStorage.selectURL()")}} trên mỗi nguồn gốc mỗi 24 giờ. Đây không phải là số lần điều hướng; thay vào đó, nó dựa trên số lượng điều hướng tiềm năng trong mỗi lệnh gọi. Mỗi khi điều hướng `selectURL()` xảy ra, ngân sách của nguồn gốc tương ứng giảm đi logarithm (cơ số 2) của số lượng URL lựa chọn.

Ngân sách điều hướng là cơ chế được thiết kế để giới hạn tốc độ rò rỉ dữ liệu cross-site đến các trang đích được điều hướng đến trong [fenced frames](/en-US/docs/Web/API/Fenced_frame_API).

## Cú pháp

```js-nolint
remainingBudget()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với số đại diện cho ngân sách điều hướng còn lại.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu module worklet chưa được thêm với {{domxref("Worklet.addModule", "addModule()")}} hoặc nếu trang gọi không có Shared Storage API trong [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.

## Ví dụ

```js
// remainingBudget() available inside a shared storage worklet module

async function retrieveBudget() {
  const budget = await this.sharedStorage.remainingBudget();
  console.log(budget);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
