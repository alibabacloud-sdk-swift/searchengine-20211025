import Foundation
import Tea
import TeaUtils
import AlibabacloudOpenApi
import AlibabaCloudOpenApiUtil
import AlibabacloudEndpointUtil

open class Client : AlibabacloudOpenApi.Client {
    public override init(_ config: AlibabacloudOpenApi.Config) throws {
        try super.init(config)
        self._endpointRule = ""
        try checkConfig(config as! AlibabacloudOpenApi.Config)
        self._endpoint = try getEndpoint("searchengine", self._regionId ?? "", self._endpointRule ?? "", self._network ?? "", self._suffix ?? "", self._endpointMap ?? [:], self._endpoint ?? "")
    }

    public func getEndpoint(_ productId: String, _ regionId: String, _ endpointRule: String, _ network: String, _ suffix: String, _ endpointMap: [String: String], _ endpoint: String) throws -> String {
        if (!TeaUtils.Client.empty(endpoint)) {
            return endpoint as! String
        }
        if (!TeaUtils.Client.isUnset(endpointMap) && !TeaUtils.Client.empty(endpointMap[regionId as! String])) {
            return endpointMap[regionId as! String] ?? ""
        }
        return try AlibabacloudEndpointUtil.Client.getEndpointRules(productId, regionId, endpointRule, network, suffix)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func buildIndexWithOptions(_ instanceId: String, _ request: BuildIndexRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> BuildIndexResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.buildMode)) {
            body["buildMode"] = request.buildMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceName)) {
            body["dataSourceName"] = request.dataSourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceType)) {
            body["dataSourceType"] = request.dataSourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataTimeSec)) {
            body["dataTimeSec"] = request.dataTimeSec!;
        }
        if (!TeaUtils.Client.isUnset(request.domain)) {
            body["domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.generation)) {
            body["generation"] = request.generation!;
        }
        if (!TeaUtils.Client.isUnset(request.partition)) {
            body["partition"] = request.partition ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "BuildIndex",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/actions/build-index",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(BuildIndexResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func buildIndex(_ instanceId: String, _ request: BuildIndexRequest) async throws -> BuildIndexResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await buildIndexWithOptions(instanceId as! String, request as! BuildIndexRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createClusterWithOptions(_ instanceId: String, _ request: CreateClusterRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateClusterResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoLoad)) {
            body["autoLoad"] = request.autoLoad!;
        }
        if (!TeaUtils.Client.isUnset(request.dataNode)) {
            body["dataNode"] = request.dataNode!;
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            body["name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.queryNode)) {
            body["queryNode"] = request.queryNode!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCluster",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateClusterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCluster(_ instanceId: String, _ request: CreateClusterRequest) async throws -> CreateClusterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createClusterWithOptions(instanceId as! String, request as! CreateClusterRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createDataSourceWithOptions(_ instanceId: String, _ request: CreateDataSourceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateDataSourceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["dryRun"] = request.dryRun!;
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoBuildIndex)) {
            body["autoBuildIndex"] = request.autoBuildIndex!;
        }
        if (!TeaUtils.Client.isUnset(request.config)) {
            body["config"] = request.config!;
        }
        if (!TeaUtils.Client.isUnset(request.domain)) {
            body["domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            body["name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.saroConfig)) {
            body["saroConfig"] = request.saroConfig!;
        }
        if (!TeaUtils.Client.isUnset(request.type)) {
            body["type"] = request.type ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query),
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateDataSource",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateDataSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createDataSource(_ instanceId: String, _ request: CreateDataSourceRequest) async throws -> CreateDataSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createDataSourceWithOptions(instanceId as! String, request as! CreateDataSourceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createIndexWithOptions(_ instanceId: String, _ request: CreateIndexRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateIndexResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["dryRun"] = request.dryRun!;
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.content)) {
            body["content"] = request.content ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSource)) {
            body["dataSource"] = request.dataSource ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceInfo)) {
            body["dataSourceInfo"] = request.dataSourceInfo!;
        }
        if (!TeaUtils.Client.isUnset(request.domain)) {
            body["domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.extend)) {
            body["extend"] = request.extend ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            body["name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.partition)) {
            body["partition"] = request.partition!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query),
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateIndex",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateIndexResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createIndex(_ instanceId: String, _ request: CreateIndexRequest) async throws -> CreateIndexResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createIndexWithOptions(instanceId as! String, request as! CreateIndexRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createInstanceWithOptions(_ request: CreateInstanceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateInstanceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.chargeType)) {
            body["chargeType"] = request.chargeType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.components)) {
            body["components"] = request.components ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            body["order"] = request.order!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateInstance",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateInstanceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createInstance(_ request: CreateInstanceRequest) async throws -> CreateInstanceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createInstanceWithOptions(request as! CreateInstanceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteAdvanceConfigWithOptions(_ instanceId: String, _ configName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteAdvanceConfigResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteAdvanceConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(configName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteAdvanceConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteAdvanceConfig(_ instanceId: String, _ configName: String) async throws -> DeleteAdvanceConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteAdvanceConfigWithOptions(instanceId as! String, configName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteDataSourceWithOptions(_ instanceId: String, _ dataSourceName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteDataSourceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteDataSource",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(dataSourceName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteDataSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteDataSource(_ instanceId: String, _ dataSourceName: String) async throws -> DeleteDataSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteDataSourceWithOptions(instanceId as! String, dataSourceName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteIndexWithOptions(_ instanceId: String, _ indexName: String, _ request: DeleteIndexRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteIndexResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dataSource)) {
            query["dataSource"] = request.dataSource ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.deleteDataSource)) {
            query["deleteDataSource"] = request.deleteDataSource!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteIndex",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteIndexResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteIndex(_ instanceId: String, _ indexName: String, _ request: DeleteIndexRequest) async throws -> DeleteIndexResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteIndexWithOptions(instanceId as! String, indexName as! String, request as! DeleteIndexRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteIndexVersionWithOptions(_ instanceId: String, _ indexName: String, _ versionName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteIndexVersionResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteIndexVersion",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(versionName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteIndexVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteIndexVersion(_ instanceId: String, _ indexName: String, _ versionName: String) async throws -> DeleteIndexVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteIndexVersionWithOptions(instanceId as! String, indexName as! String, versionName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteInstanceWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteInstanceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteInstance",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteInstanceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteInstance(_ instanceId: String) async throws -> DeleteInstanceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteInstanceWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func forceSwitchWithOptions(_ instanceId: String, _ fsmId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ForceSwitchResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ForceSwitch",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/force-switch/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(fsmId),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ForceSwitchResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func forceSwitch(_ instanceId: String, _ fsmId: String) async throws -> ForceSwitchResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await forceSwitchWithOptions(instanceId as! String, fsmId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getAdvanceConfigWithOptions(_ instanceId: String, _ configName: String, _ request: GetAdvanceConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetAdvanceConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.type)) {
            query["type"] = request.type ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetAdvanceConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(configName),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetAdvanceConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getAdvanceConfig(_ instanceId: String, _ configName: String, _ request: GetAdvanceConfigRequest) async throws -> GetAdvanceConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getAdvanceConfigWithOptions(instanceId as! String, configName as! String, request as! GetAdvanceConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getAdvanceConfigFileWithOptions(_ instanceId: String, _ configName: String, _ request: GetAdvanceConfigFileRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetAdvanceConfigFileResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.fileName)) {
            query["fileName"] = request.fileName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetAdvanceConfigFile",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(configName) + "/file",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetAdvanceConfigFileResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getAdvanceConfigFile(_ instanceId: String, _ configName: String, _ request: GetAdvanceConfigFileRequest) async throws -> GetAdvanceConfigFileResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getAdvanceConfigFileWithOptions(instanceId as! String, configName as! String, request as! GetAdvanceConfigFileRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getClusterWithOptions(_ instanceId: String, _ clusterName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetClusterResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetCluster",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(clusterName),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetClusterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getCluster(_ instanceId: String, _ clusterName: String) async throws -> GetClusterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getClusterWithOptions(instanceId as! String, clusterName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getClusterRunTimeInfoWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetClusterRunTimeInfoResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetClusterRunTimeInfo",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/cluster-run-time-info",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetClusterRunTimeInfoResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getClusterRunTimeInfo(_ instanceId: String) async throws -> GetClusterRunTimeInfoResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getClusterRunTimeInfoWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataSourceWithOptions(_ instanceId: String, _ dataSourceName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDataSourceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDataSource",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(dataSourceName),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDataSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataSource(_ instanceId: String, _ dataSourceName: String) async throws -> GetDataSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDataSourceWithOptions(instanceId as! String, dataSourceName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataSourceDeployWithOptions(_ instanceId: String, _ deployName: String, _ dataSourceName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDataSourceDeployResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDataSourceDeploy",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(dataSourceName) + "/deploys/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(deployName),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDataSourceDeployResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataSourceDeploy(_ instanceId: String, _ deployName: String, _ dataSourceName: String) async throws -> GetDataSourceDeployResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDataSourceDeployWithOptions(instanceId as! String, deployName as! String, dataSourceName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDeployGraphWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDeployGraphResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDeployGraph",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/deploy-graph",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDeployGraphResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDeployGraph(_ instanceId: String) async throws -> GetDeployGraphResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDeployGraphWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getFileWithOptions(_ instanceId: String, _ indexName: String, _ versionName: String, _ request: GetFileRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetFileResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.fileName)) {
            query["fileName"] = request.fileName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetFile",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(versionName) + "/file",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetFileResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getFile(_ instanceId: String, _ indexName: String, _ versionName: String, _ request: GetFileRequest) async throws -> GetFileResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getFileWithOptions(instanceId as! String, indexName as! String, versionName as! String, request as! GetFileRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getIndexWithOptions(_ instanceId: String, _ indexName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetIndexResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetIndex",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetIndexResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getIndex(_ instanceId: String, _ indexName: String) async throws -> GetIndexResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getIndexWithOptions(instanceId as! String, indexName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getIndexVersionWithOptions(_ instanceId: String, _ clusterName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetIndexVersionResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetIndexVersion",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(clusterName) + "/index-version",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetIndexVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getIndexVersion(_ instanceId: String, _ clusterName: String) async throws -> GetIndexVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getIndexVersionWithOptions(instanceId as! String, clusterName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getInstanceWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetInstanceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetInstance",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetInstanceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getInstance(_ instanceId: String) async throws -> GetInstanceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getInstanceWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getNodeConfigWithOptions(_ instanceId: String, _ request: GetNodeConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetNodeConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clusterName)) {
            query["clusterName"] = request.clusterName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.type)) {
            query["type"] = request.type ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetNodeConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/node-config",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetNodeConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getNodeConfig(_ instanceId: String, _ request: GetNodeConfigRequest) async throws -> GetNodeConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getNodeConfigWithOptions(instanceId as! String, request as! GetNodeConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listAdvanceConfigDirWithOptions(_ instanceId: String, _ configName: String, _ request: ListAdvanceConfigDirRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListAdvanceConfigDirResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dirName)) {
            query["dirName"] = request.dirName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListAdvanceConfigDir",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(configName) + "/dir",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListAdvanceConfigDirResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listAdvanceConfigDir(_ instanceId: String, _ configName: String, _ request: ListAdvanceConfigDirRequest) async throws -> ListAdvanceConfigDirResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listAdvanceConfigDirWithOptions(instanceId as! String, configName as! String, request as! ListAdvanceConfigDirRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listAdvanceConfigsWithOptions(_ instanceId: String, _ request: ListAdvanceConfigsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListAdvanceConfigsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dataSourceName)) {
            query["dataSourceName"] = request.dataSourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.indexName)) {
            query["indexName"] = request.indexName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.type)) {
            query["type"] = request.type ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListAdvanceConfigs",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListAdvanceConfigsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listAdvanceConfigs(_ instanceId: String, _ request: ListAdvanceConfigsRequest) async throws -> ListAdvanceConfigsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listAdvanceConfigsWithOptions(instanceId as! String, request as! ListAdvanceConfigsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listClusterNamesWithOptions(_ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListClusterNamesResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListClusterNames",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/cluster-names",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListClusterNamesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listClusterNames() async throws -> ListClusterNamesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listClusterNamesWithOptions(headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listClusterTasksWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListClusterTasksResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListClusterTasks",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/cluster-tasks",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListClusterTasksResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listClusterTasks(_ instanceId: String) async throws -> ListClusterTasksResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listClusterTasksWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listClustersWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListClustersResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListClusters",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListClustersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listClusters(_ instanceId: String) async throws -> ListClustersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listClustersWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDataSourceSchemasWithOptions(_ instanceId: String, _ dataSourceName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListDataSourceSchemasResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListDataSourceSchemas",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(dataSourceName) + "/schemas",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListDataSourceSchemasResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDataSourceSchemas(_ instanceId: String, _ dataSourceName: String) async throws -> ListDataSourceSchemasResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listDataSourceSchemasWithOptions(instanceId as! String, dataSourceName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDataSourceTasksWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListDataSourceTasksResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListDataSourceTasks",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-source-tasks",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListDataSourceTasksResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDataSourceTasks(_ instanceId: String) async throws -> ListDataSourceTasksResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listDataSourceTasksWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDataSourcesWithOptions(_ instanceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListDataSourcesResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListDataSources",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListDataSourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDataSources(_ instanceId: String) async throws -> ListDataSourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listDataSourcesWithOptions(instanceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDateSourceGenerationsWithOptions(_ instanceId: String, _ dataSourceName: String, _ request: ListDateSourceGenerationsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListDateSourceGenerationsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.domainName)) {
            query["domainName"] = request.domainName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.validStatus)) {
            query["validStatus"] = request.validStatus!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListDateSourceGenerations",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(dataSourceName) + "/generations",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListDateSourceGenerationsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDateSourceGenerations(_ instanceId: String, _ dataSourceName: String, _ request: ListDateSourceGenerationsRequest) async throws -> ListDateSourceGenerationsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listDateSourceGenerationsWithOptions(instanceId as! String, dataSourceName as! String, request as! ListDateSourceGenerationsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listIndexesWithOptions(_ instanceId: String, _ request: ListIndexesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListIndexesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.newMode)) {
            query["newMode"] = request.newMode!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListIndexes",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListIndexesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listIndexes(_ instanceId: String, _ request: ListIndexesRequest) async throws -> ListIndexesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listIndexesWithOptions(instanceId as! String, request as! ListIndexesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listInstanceSpecsWithOptions(_ instanceId: String, _ request: ListInstanceSpecsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListInstanceSpecsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.type)) {
            query["type"] = request.type ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListInstanceSpecs",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/specs",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListInstanceSpecsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listInstanceSpecs(_ instanceId: String, _ request: ListInstanceSpecsRequest) async throws -> ListInstanceSpecsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listInstanceSpecsWithOptions(instanceId as! String, request as! ListInstanceSpecsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listInstancesWithOptions(_ tmpReq: ListInstancesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListInstancesResponse {
        try TeaUtils.Client.validateModel(tmpReq)
        var request: ListInstancesShrinkRequest = ListInstancesShrinkRequest([:])
        AlibabaCloudOpenApiUtil.Client.convert(tmpReq, request)
        if (!TeaUtils.Client.isUnset(tmpReq.tags)) {
            request.tagsShrink = AlibabaCloudOpenApiUtil.Client.arrayToStringWithSpecifiedStyle(tmpReq.tags, "tags", "json")
        }
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.edition)) {
            query["edition"] = request.edition ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.instanceId)) {
            query["instanceId"] = request.instanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["pageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["pageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceGroupId)) {
            query["resourceGroupId"] = request.resourceGroupId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.tagsShrink)) {
            query["tags"] = request.tagsShrink ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListInstances",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListInstancesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listInstances(_ request: ListInstancesRequest) async throws -> ListInstancesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listInstancesWithOptions(request as! ListInstancesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listOnlineConfigsWithOptions(_ instanceId: String, _ nodeName: String, _ request: ListOnlineConfigsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListOnlineConfigsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.domain)) {
            query["domain"] = request.domain ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListOnlineConfigs",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/node/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(nodeName) + "/online-configs",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListOnlineConfigsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listOnlineConfigs(_ instanceId: String, _ nodeName: String, _ request: ListOnlineConfigsRequest) async throws -> ListOnlineConfigsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listOnlineConfigsWithOptions(instanceId as! String, nodeName as! String, request as! ListOnlineConfigsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listQueryResultWithOptions(_ instanceId: String, _ request: ListQueryResultRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListQueryResultResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.query)) {
            query["query"] = request.query ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sql)) {
            query["sql"] = request.sql ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListQueryResult",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/query",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListQueryResultResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listQueryResult(_ instanceId: String, _ request: ListQueryResultRequest) async throws -> ListQueryResultResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listQueryResultWithOptions(instanceId as! String, request as! ListQueryResultRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyAdvanceConfigFileWithOptions(_ instanceId: String, _ configName: String, _ request: ModifyAdvanceConfigFileRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyAdvanceConfigFileResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.fileName)) {
            query["fileName"] = request.fileName ?? "";
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.content)) {
            body["content"] = request.content ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.variables)) {
            body["variables"] = request.variables ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query),
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyAdvanceConfigFile",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(configName) + "/file",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyAdvanceConfigFileResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyAdvanceConfigFile(_ instanceId: String, _ configName: String, _ request: ModifyAdvanceConfigFileRequest) async throws -> ModifyAdvanceConfigFileResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyAdvanceConfigFileWithOptions(instanceId as! String, configName as! String, request as! ModifyAdvanceConfigFileRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyClusterDescWithOptions(_ instanceId: String, _ clusterName: String, _ request: ModifyClusterDescRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyClusterDescResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.body)) {
            body["body"] = request.body ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyClusterDesc",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(clusterName) + "/desc",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyClusterDescResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyClusterDesc(_ instanceId: String, _ clusterName: String, _ request: ModifyClusterDescRequest) async throws -> ModifyClusterDescResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyClusterDescWithOptions(instanceId as! String, clusterName as! String, request as! ModifyClusterDescRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyClusterOfflineConfigWithOptions(_ instanceId: String, _ request: ModifyClusterOfflineConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyClusterOfflineConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.buildMode)) {
            body["buildMode"] = request.buildMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.config)) {
            body["config"] = request.config ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceName)) {
            body["dataSourceName"] = request.dataSourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceType)) {
            body["dataSourceType"] = request.dataSourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataTimeSec)) {
            body["dataTimeSec"] = request.dataTimeSec!;
        }
        if (!TeaUtils.Client.isUnset(request.domain)) {
            body["domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.generation)) {
            body["generation"] = request.generation!;
        }
        if (!TeaUtils.Client.isUnset(request.partition)) {
            body["partition"] = request.partition ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pushMode)) {
            body["pushMode"] = request.pushMode ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyClusterOfflineConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/cluster-offline-config",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyClusterOfflineConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyClusterOfflineConfig(_ instanceId: String, _ request: ModifyClusterOfflineConfigRequest) async throws -> ModifyClusterOfflineConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyClusterOfflineConfigWithOptions(instanceId as! String, request as! ModifyClusterOfflineConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyClusterOnlineConfigWithOptions(_ instanceId: String, _ request: ModifyClusterOnlineConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyClusterOnlineConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clusters)) {
            body["clusters"] = request.clusters ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.config)) {
            body["config"] = request.config ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyClusterOnlineConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/cluster-online-config",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyClusterOnlineConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyClusterOnlineConfig(_ instanceId: String, _ request: ModifyClusterOnlineConfigRequest) async throws -> ModifyClusterOnlineConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyClusterOnlineConfigWithOptions(instanceId as! String, request as! ModifyClusterOnlineConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyDataSourceWithOptions(_ instanceId: String, _ dataSourceName: String, _ request: ModifyDataSourceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyDataSourceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["dryRun"] = request.dryRun!;
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.body)) {
            body["body"] = request.body ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query),
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyDataSource",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/data-sources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(dataSourceName),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyDataSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyDataSource(_ instanceId: String, _ dataSourceName: String, _ request: ModifyDataSourceRequest) async throws -> ModifyDataSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyDataSourceWithOptions(instanceId as! String, dataSourceName as! String, request as! ModifyDataSourceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyFileWithOptions(_ instanceId: String, _ indexName: String, _ versionName: String, _ request: ModifyFileRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyFileResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.fileName)) {
            query["fileName"] = request.fileName ?? "";
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.content)) {
            body["content"] = request.content ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.partition)) {
            body["partition"] = request.partition!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query),
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyFile",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(versionName) + "/file",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyFileResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyFile(_ instanceId: String, _ indexName: String, _ versionName: String, _ request: ModifyFileRequest) async throws -> ModifyFileResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyFileWithOptions(instanceId as! String, indexName as! String, versionName as! String, request as! ModifyFileRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyIndexPartitionWithOptions(_ instanceId: String, _ request: ModifyIndexPartitionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyIndexPartitionResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dataSourceName)) {
            body["dataSourceName"] = request.dataSourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.domainName)) {
            body["domainName"] = request.domainName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.generation)) {
            body["generation"] = request.generation!;
        }
        if (!TeaUtils.Client.isUnset(request.indexInfos)) {
            body["indexInfos"] = request.indexInfos ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyIndexPartition",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/index-partition",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyIndexPartitionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyIndexPartition(_ instanceId: String, _ request: ModifyIndexPartitionRequest) async throws -> ModifyIndexPartitionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyIndexPartitionWithOptions(instanceId as! String, request as! ModifyIndexPartitionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyIndexVersionWithOptions(_ instanceId: String, _ clusterName: String, _ request: ModifyIndexVersionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyIndexVersionResponse {
        try TeaUtils.Client.validateModel(request)
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": TeaUtils.Client.toArray(request.body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyIndexVersion",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(clusterName) + "/index-version",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyIndexVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyIndexVersion(_ instanceId: String, _ clusterName: String, _ request: ModifyIndexVersionRequest) async throws -> ModifyIndexVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyIndexVersionWithOptions(instanceId as! String, clusterName as! String, request as! ModifyIndexVersionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyNodeConfigWithOptions(_ instanceId: String, _ request: ModifyNodeConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyNodeConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clusterName)) {
            query["clusterName"] = request.clusterName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceName)) {
            query["dataSourceName"] = request.dataSourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.type)) {
            query["type"] = request.type ?? "";
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.active)) {
            body["active"] = request.active!;
        }
        if (!TeaUtils.Client.isUnset(request.dataDuplicateNumber)) {
            body["dataDuplicateNumber"] = request.dataDuplicateNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.dataFragmentNumber)) {
            body["dataFragmentNumber"] = request.dataFragmentNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.minServicePercent)) {
            body["minServicePercent"] = request.minServicePercent!;
        }
        if (!TeaUtils.Client.isUnset(request.published)) {
            body["published"] = request.published!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query),
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyNodeConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/node-config",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyNodeConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyNodeConfig(_ instanceId: String, _ request: ModifyNodeConfigRequest) async throws -> ModifyNodeConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyNodeConfigWithOptions(instanceId as! String, request as! ModifyNodeConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyOnlineConfigWithOptions(_ instanceId: String, _ nodeName: String, _ indexName: String, _ request: ModifyOnlineConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyOnlineConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.body)) {
            body["body"] = request.body ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyOnlineConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/node/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(nodeName) + "/online-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyOnlineConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyOnlineConfig(_ instanceId: String, _ nodeName: String, _ indexName: String, _ request: ModifyOnlineConfigRequest) async throws -> ModifyOnlineConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyOnlineConfigWithOptions(instanceId as! String, nodeName as! String, indexName as! String, request as! ModifyOnlineConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyPasswordWithOptions(_ instanceId: String, _ request: ModifyPasswordRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyPasswordResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.password)) {
            body["password"] = request.password ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.username)) {
            body["username"] = request.username ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyPassword",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/password",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyPasswordResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyPassword(_ instanceId: String, _ request: ModifyPasswordRequest) async throws -> ModifyPasswordResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await modifyPasswordWithOptions(instanceId as! String, request as! ModifyPasswordRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishAdvanceConfigWithOptions(_ instanceId: String, _ configName: String, _ request: PublishAdvanceConfigRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PublishAdvanceConfigResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.body)) {
            body["body"] = request.body ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PublishAdvanceConfig",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/advanced-configs/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(configName) + "/actions/publish",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PublishAdvanceConfigResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishAdvanceConfig(_ instanceId: String, _ configName: String, _ request: PublishAdvanceConfigRequest) async throws -> PublishAdvanceConfigResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await publishAdvanceConfigWithOptions(instanceId as! String, configName as! String, request as! PublishAdvanceConfigRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishIndexVersionWithOptions(_ instanceId: String, _ indexName: String, _ request: PublishIndexVersionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PublishIndexVersionResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.body)) {
            body["body"] = request.body ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PublishIndexVersion",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/indexes/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(indexName) + "/actions/publish",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PublishIndexVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishIndexVersion(_ instanceId: String, _ indexName: String, _ request: PublishIndexVersionRequest) async throws -> PublishIndexVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await publishIndexVersionWithOptions(instanceId as! String, indexName as! String, request as! PublishIndexVersionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func recoverIndexWithOptions(_ instanceId: String, _ request: RecoverIndexRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> RecoverIndexResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.buildDeployId)) {
            body["buildDeployId"] = request.buildDeployId!;
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceName)) {
            body["dataSourceName"] = request.dataSourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.generation)) {
            body["generation"] = request.generation ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.indexName)) {
            body["indexName"] = request.indexName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RecoverIndex",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/recover-index",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RecoverIndexResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func recoverIndex(_ instanceId: String, _ request: RecoverIndexRequest) async throws -> RecoverIndexResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await recoverIndexWithOptions(instanceId as! String, request as! RecoverIndexRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeClusterWithOptions(_ instanceId: String, _ clusterName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> RemoveClusterResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RemoveCluster",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/clusters/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(clusterName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RemoveClusterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeCluster(_ instanceId: String, _ clusterName: String) async throws -> RemoveClusterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await removeClusterWithOptions(instanceId as! String, clusterName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func stopTaskWithOptions(_ instanceId: String, _ fsmId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> StopTaskResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "StopTask",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId) + "/stop-task/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(fsmId),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(StopTaskResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func stopTask(_ instanceId: String, _ fsmId: String) async throws -> StopTaskResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await stopTaskWithOptions(instanceId as! String, fsmId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateInstanceWithOptions(_ instanceId: String, _ request: UpdateInstanceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateInstanceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.components)) {
            body["components"] = request.components ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.orderType)) {
            body["orderType"] = request.orderType ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateInstance",
            "version": "2021-10-25",
            "protocol": "HTTPS",
            "pathname": "/openapi/ha3/instances/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(instanceId),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateInstanceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateInstance(_ instanceId: String, _ request: UpdateInstanceRequest) async throws -> UpdateInstanceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateInstanceWithOptions(instanceId as! String, request as! UpdateInstanceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }
}
