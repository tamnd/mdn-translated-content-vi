---
title: SharedStorageOperation
slug: Web/API/SharedStorageOperation
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SharedStorageOperation
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`SharedStorageOperation`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho lớp cơ sở cho tất cả các loại thao tác output gate.

Các loại output gate được chi tiết dưới đây:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Tên</th>
      <th>Mô tả</th>
      <th>Được định nghĩa bởi</th>
      <th>Được gọi bởi</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>URL Selection</td>
      <td>Dùng để chọn URL để hiển thị cho người dùng dựa trên dữ liệu shared storage.</td>
      <td>{{domxref("SharedStorageSelectURLOperation")}}</td>
      <td>{{domxref("WindowSharedStorage.selectURL()", "selectURL()")}}</td>
    </tr>
    <tr>
      <td>Run</td>
      <td>Cách chung để xử lý một số dữ liệu shared storage. Được sử dụng, ví dụ, bởi <a href="https://privacysandbox.google.com/private-advertising/private-aggregation">Private Aggregation API</a> để xử lý dữ liệu shared storage và tạo báo cáo tổng hợp. </td>
      <td>{{domxref("SharedStorageRunOperation")}}</td>
      <td>{{domxref("WindowSharedStorage.run()", "run()")}}</td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Định nghĩa các thao tác riêng lẻ

Nhiều script module shared storage worklet chỉ định nghĩa và đăng ký một thao tác duy nhất; bạn có thể xem ví dụ trên các trang {{domxref("SharedStorageSelectURLOperation")}} và {{domxref("SharedStorageRunOperation")}}.

### Định nghĩa nhiều thao tác

Trong các trường hợp nâng cao hơn, có thể định nghĩa và đăng ký nhiều thao tác trong cùng script module shared storage worklet với các tên khác nhau. Trong script module worklet sau, chúng ta định nghĩa thao tác URL Selection tên `SelectURLOperation` chọn URL cho A/B testing, và thao tác Run tên `ExperimentGroupReportingOperation`, chạy báo cáo histogram dựa trên nhóm A/B testing của người dùng:

```js
// ab-testing-worklet.js

class SelectURLOperation {
  async run(urls, data) {
    // Đọc nhóm của người dùng từ shared storage
    const experimentGroup = await sharedStorage.get("ab-testing-group");

    // Ghi log vào console cho demo
    console.log(`urls = ${JSON.stringify(urls)}`);
    console.log(`data = ${JSON.stringify(data)}`);
    console.log(`ab-testing-group in shared storage is ${experimentGroup}`);

    // Trả về index của nhóm
    return data.indexOf(experimentGroup);
  }
}

function getBucketForTestingGroup(testingGroup) {
  switch (testingGroup) {
    case "control":
      return 0;
    case "experiment-a":
      return 1;
    case "experiment-b":
      return 2;
  }
}

class ExperimentGroupReportingOperation {
  async run() {
    const experimentGroup = await sharedStorage.get("ab-testing-group");

    const bucket = BigInt(getBucketForTestingGroup(experimentGroup));
    privateAggregation.contributeToHistogram({ bucket, value: 1 });
  }
}

// Đăng ký các thao tác
register("ab-testing", SelectURLOperation);
register("experiment-group-reporting", ExperimentGroupReportingOperation);
```

Trong ngữ cảnh duyệt web chính, các thao tác này được gọi bởi {{domxref("WindowSharedStorage.selectURL()", "selectURL()")}} và {{domxref("WindowSharedStorage.run()", "run()")}}, tương ứng.

```js
// Cho mục đích demo. Hostname được dùng để xác định việc sử dụng
// URL localhost phát triển so với URL sản xuất
const contentProducerUrl = window.location.host;

// Ánh xạ các nhóm thực nghiệm với URL
const EXPERIMENT_MAP = [
  {
    group: "control",
    url: `https://${contentProducerUrl}/ads/default-ad.html`,
  },
  {
    group: "experiment-a",
    url: `https://${contentProducerUrl}/ads/experiment-ad-a.html`,
  },
  {
    group: "experiment-b",
    url: `https://${contentProducerUrl}/ads/experiment-ad-b.html`,
  },
];

// Chọn nhóm ngẫu nhiên cho thực nghiệm ban đầu
function getRandomExperiment() {
  const randomIndex = Math.floor(Math.random() * EXPERIMENT_MAP.length);
  return EXPERIMENT_MAP[randomIndex].group;
}

async function injectAd() {
  // Tải module worklet
  await window.sharedStorage.worklet.addModule("ab-testing-worklet.js");

  // Đặt giá trị ban đầu trong lưu trữ thành nhóm thực nghiệm ngẫu nhiên
  window.sharedStorage.set("ab-testing-group", getRandomExperiment(), {
    ignoreIfPresent: true,
  });

  const urls = EXPERIMENT_MAP.map(({ url }) => ({ url }));
  const groups = EXPERIMENT_MAP.map(({ group }) => group);

  // Phân giải lệnh gọi selectURL thành fenced frame config chỉ khi nó tồn tại trên trang
  const resolveToConfig = typeof window.FencedFrameConfig !== "undefined";

  // Chạy thao tác URL selection để chọn quảng cáo dựa trên nhóm thực nghiệm trong shared storage
  const selectedUrl = await window.sharedStorage.selectURL("ab-testing", urls, {
    data: groups,
    resolveToConfig,
    keepAlive: true,
  });

  const adSlot = document.getElementById("ad-slot");

  if (resolveToConfig && selectedUrl instanceof FencedFrameConfig) {
    adSlot.config = selectedUrl;
  } else {
    adSlot.src = selectedUrl;
  }

  // Chạy thao tác báo cáo
  await window.sharedStorage.run("experiment-group-reporting");
}

injectAd();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
