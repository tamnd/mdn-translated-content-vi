---
title: Origin-Agent-Cluster header
short-title: Origin-Agent-Cluster
slug: Web/HTTP/Reference/Headers/Origin-Agent-Cluster
page-type: http-header
browser-compat: http.headers.Origin-Agent-Cluster
sidebar: http
---

Tiêu đề HTTP **`Origin-Agent-Cluster`** {{Glossary("response header")}} được sử dụng để yêu cầu rằng {{domxref("Document")}} liên quan nên được đặt trong [cụm tác nhân](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing) được khóa theo nguồn gốc.
Điều này có nghĩa là các tài nguyên hệ điều hành (ví dụ: tiến trình hệ điều hành) được sử dụng để đánh giá tài liệu chỉ nên được chia sẻ với các tài liệu khác từ cùng {{glossary("origin")}}.

Tác dụng của điều này là một tài liệu tốn tài nguyên sẽ ít có khả năng làm giảm hiệu suất của các tài liệu từ các nguồn gốc khác.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Origin-Agent-Cluster: <boolean>
```

### Chỉ thị

- `<boolean>`
  - : `?1` chỉ báo rằng {{domxref("Document")}} liên quan nên được đặt trong cụm tác nhân được khóa theo nguồn gốc.
    Các giá trị khác với `?1` bị bỏ qua (ví dụ: trường có cấu trúc `?0` cho false).

## Mô tả

Các trình duyệt web hiện đại có kiến trúc đa tiến trình trong đó các trang từ các nguồn gốc khác nhau có thể chạy trong các tiến trình hệ điều hành khác nhau. Điều này quan trọng cho hiệu suất, vì nó có nghĩa là trang tốn tài nguyên sẽ không có nhiều tác động đến các trang khác mà người dùng có mở.

Tuy nhiên, trình duyệt thường không thể chạy các trang {{glossary("site", "cùng trang web")}}, {{glossary("origin", "khác nguồn gốc")}} trong các tiến trình khác nhau, vì một số API DOM phụ thuộc vào giao tiếp cùng trang web khác nguồn gốc. Ví dụ: theo mặc định, các trang từ hai nguồn gốc sau đây sẽ chia sẻ cùng tài nguyên hệ điều hành:

```plain
https://apples.example.org
https://oranges.example.org
```

Bằng cách đặt tiêu đề `Origin-Agent-Cluster`, trang có thể yêu cầu trình duyệt phân bổ tài nguyên chuyên dụng cho nguồn gốc này không được chia sẻ với bất kỳ nguồn gốc nào khác.

Trình duyệt không bắt buộc phải tôn trọng yêu cầu. Nếu có, thuộc tính {{domxref("Window.originAgentCluster")}} trả về `true`, và cửa sổ không thể thực hiện những điều sau, tất cả phụ thuộc vào giao tiếp cùng trang web khác nguồn gốc:

- Sử dụng {{domxref("Document.domain")}}.
- Gửi các đối tượng [`WebAssembly.Module`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Module) đến các trang cùng trang web khác nguồn gốc khác bằng {{domxref("Window.postMessage()", "postMessage()")}}.
- Gửi các đối tượng {{jsxref("SharedArrayBuffer")}} hoặc [`WebAssembly.Memory`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) đến các trang cùng trang web khác nguồn gốc.

Cụm tác nhân được khóa theo nguồn gốc không nên được coi là tính năng bảo mật: trình duyệt có thể bỏ qua yêu cầu vì nhiều lý do khác nhau, hoặc chọn triển khai nó theo cách không cung cấp bảo vệ bộ nhớ (ví dụ: sử dụng các luồng riêng biệt thay vì các tiến trình riêng biệt). Thay vào đó, tính năng này là gợi ý rằng trải nghiệm người dùng sẽ được cải thiện nếu nguồn gốc này được phân bổ tài nguyên chuyên dụng.

Trình duyệt sẽ đảm bảo rằng tất cả các trang từ một nguồn gốc nhất định đều được khóa theo nguồn gốc hoặc không. Điều này có nghĩa là:

- Nếu trang đầu tiên từ nguồn gốc không đặt tiêu đề, thì không có trang nào khác từ nguồn gốc đó sẽ được khóa theo nguồn gốc, ngay cả khi những trang khác đặt tiêu đề.
- Nếu trang đầu tiên từ nguồn gốc đặt tiêu đề và được khóa theo nguồn gốc, thì tất cả các trang khác từ nguồn gốc đó sẽ được khóa theo nguồn gốc dù chúng có yêu cầu hay không.

Để tránh tình huống không thể đoán trước này, bạn nên đặt tiêu đề này cho tất cả các trang từ một nguồn gốc nhất định, hoặc không có trang nào.

## Ví dụ

```http
Origin-Agent-Cluster: ?1
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window.originAgentCluster")}}
- [Cụm tác nhân và chia sẻ bộ nhớ](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing) trong _Mô hình thực thi JavaScript_
- [Requesting performance isolation with the Origin-Agent-Cluster header](https://web.dev/articles/origin-agent-cluster) trên web.dev
