---
title: "WebGL2RenderingContext: phương thức getQuery()"
short-title: getQuery()
slug: Web/API/WebGL2RenderingContext/getQuery
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getQuery()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về {{domxref("WebGLQuery")}} hiện đang hoạt động cho `target`, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Cú pháp

```js-nolint
getQuery(target, pname)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của truy vấn. Các giá trị có thể:
    - `gl.ANY_SAMPLES_PASSED`
      - : Chỉ định một truy vấn che khuất: các truy vấn này phát hiện xem một đối tượng có hiển thị hay không (liệu các lệnh vẽ có vượt qua kiểm tra depth hay không và nếu có, bao nhiêu mẫu vượt qua).
    - `gl.ANY_SAMPLES_PASSED_CONSERVATIVE`
      - : Tương tự như trên, nhưng kém chính xác hơn và nhanh hơn.
    - `gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN`
      - : Số lượng hình nguyên được ghi vào các bộ đệm transform feedback.

- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của đối tượng truy vấn. Phải là `gl.CURRENT_QUERY`.

### Giá trị trả về

Một đối tượng {{domxref("WebGLQuery")}}.

## Ví dụ

```js
const currentQuery = gl.getQuery(gl.ANY_SAMPLES_PASSED, gl.CURRENT_QUERY);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}