---
title: Access-Control-Max-Age header
short-title: Access-Control-Max-Age
slug: Web/HTTP/Reference/Headers/Access-Control-Max-Age
page-type: http-header
browser-compat: http.headers.Access-Control-Max-Age
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Max-Age`** {{Glossary("response header", "phản hồi")}} chỉ ra thời gian bao lâu kết quả của {{glossary("preflight request", "yêu cầu preflight")}} (tức là thông tin chứa trong các tiêu đề {{HTTPHeader("Access-Control-Allow-Methods")}} và {{HTTPHeader("Access-Control-Allow-Headers")}}) có thể được lưu vào bộ nhớ đệm.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Access-Control-Max-Age: <delta-seconds>
```

## Chỉ thị

- `<delta-seconds>`
  - : Số giây tối đa mà kết quả có thể được lưu vào bộ nhớ đệm dưới dạng số nguyên không âm không dấu. Firefox [giới hạn ở 24 giờ](https://searchfox.org/firefox-main/source/netwerk/protocol/http/nsCORSListenerProxy.cpp#1393) (86400 giây). Chromium (trước phiên bản 76) [giới hạn ở 10 phút](https://source.chromium.org/chromium/chromium/src/+/main:services/network/public/cpp/cors/preflight_result.cc;drc=52002151773d8cd9ffc5f557cd7cc880fddcae3e;l=36) (600 giây). Chromium (bắt đầu từ phiên bản 76) [giới hạn ở 2 giờ](https://source.chromium.org/chromium/chromium/src/+/main:services/network/public/cpp/cors/preflight_result.cc;drc=49e7c0b4886cac1f3d09dc046bd528c9c811a0fa;l=31) (7200 giây). Giá trị mặc định là 5 giây.

## Ví dụ

Lưu vào bộ nhớ đệm kết quả của yêu cầu preflight trong 10 phút:

```http
Access-Control-Max-Age: 600
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Access-Control-Allow-Headers")}}
- {{HTTPHeader("Access-Control-Allow-Methods")}}
