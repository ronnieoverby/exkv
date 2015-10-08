defmodule KV.BucketTest do
	use ExUnit.Case, async: true

	setup do
		{:ok, bucket} = KV.Bucket.start_link
		{:ok, bucket: bucket}
	end

	test "stores values by key", %{bucket: bucket} do
		assert KV.Bucket.get(bucket, "milk") == nil

		KV.Bucket.put(bucket, "milk", 3)
		assert KV.Bucket.get(bucket, "milk") == 3
	end

	test "deletes values by key", %{bucket: bucket} do
		key = "Ronnie"
		val = 31
		KV.Bucket.put(bucket, key, val)
		deleted = KV.Bucket.delete(bucket, key)
		assert val == deleted
	end
end