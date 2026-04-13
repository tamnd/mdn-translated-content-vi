---
title: "WebGL2RenderingContext: phương thức endQuery()"
short-title: endQuery()
slug: Web/API/WebGL2RenderingContext/endQuery
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.endQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.endQuery()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) đánh dấu kết thúc của một target truy vấn đã cho.

## Cú pháp

```js-nolint
endQuery(target)
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

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const query = gl.createQuery();
gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);

// …

gl.endQuery(gl.ANY_SAMPLES_PASSED);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}