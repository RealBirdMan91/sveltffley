export type AsyncResult<T> = {
    loading: true,
    failed: false,
    result: null,
  } | {
    loading: false,
    failed: true,
    result: null,
  } | {
    loading: false,
    failed: false,
    result: T,
  }

export function isDataLoaded<T>(
    value: AsyncResult<T>
  ): value is { loading: false; failed: false; result: T } {
    return !value.loading && !value.failed;
  }
  