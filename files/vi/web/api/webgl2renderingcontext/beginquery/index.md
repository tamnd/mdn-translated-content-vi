---
title: "WebGL2RenderingContext: phương thức beginQuery()"
short-title: beginQuery()
slug: Web/API/WebGL2RenderingContext/beginQuery
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.beginQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.beginQuery()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) bắt đầu một truy vấn không đồng bộ. Tham số `target` cho biết loại truy vấn cần bắt đầu.

## Cú pháp

```js-nolint
beginQuery(target, query)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của truy vấn. Các giá trị có thể:
    - `gl.ANY_SAMPLES_PASSED`
      - : Chỉ định một truy vấn che khuất: các truy vấn này
        phát hiện xem một đối tượng có hiển thị hay không (liệu các lệnh vẽ có vượt qua
        kiểm tra depth hay không và nếu có, bao nhiêu mẫu vượt qua).
    - `gl.ANY_SAMPLES_PASSED_CONSERVATIVE`
      - : Tương tự như trên, nhưng
        kém chính xác hơn và nhanh hơn.
    - `gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN`
      - : Số lượng hình nguyên được
        ghi vào các bộ đệm transform feedback.

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để bắt đầu truy vấn.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const query = gl.createQuery();
gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);

// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}
