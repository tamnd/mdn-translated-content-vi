---
title: "Navigator: thuộc tính buildID"
short-title: buildID
slug: Web/API/Navigator/buildID
page-type: web-api-instance-property
status:
  - non-standard
browser-compat: api.Navigator.buildID
---

{{ApiRef("HTML DOM")}}{{Non-standard_Header}}

Trả về mã định danh bản dựng của trình duyệt. Trong các trình duyệt hiện đại, thuộc tính này hiện trả về dấu thời gian cố định làm biện pháp bảo mật, ví dụ: `20181001000000` trong Firefox 64 trở đi.

## Giá trị

Một chuỗi đại diện cho mã định danh bản dựng của ứng dụng. ID bản dựng có dạng `YYYYMMDDHHMMSS`.

## Ví dụ

```js
console.log(navigator.buildID);
```

## Thông số kỹ thuật

Không phải là một phần của bất kỳ tiêu chuẩn công cộng nào.

## Khả năng tương thích của trình duyệt

{{Compat}}
