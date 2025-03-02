test_all <- (identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_JOB"), "test-coverage"))

test_that ("missing objects", {
    expect_error (extract_osm_objects (), "key can not be NULL")
    expect_error (
        extract_osm_objects (key = "aaa"),
        "bbox must be provided"
    )
})

test_that ("key missing", {
    bbox <- get_bbox (c (-0.12, 51.51, -0.11, 51.52))
    expect_error (
        extract_osm_objects (bbox = bbox, key = NULL),
        "key can not be NULL"
    )
    expect_error (
        extract_osm_objects (bbox = bbox, key = NA),
        "key can not be NA"
    )
    expect_error (
        extract_osm_objects (bbox = bbox),
        "key can not be NULL"
    )
})

skip_if (!curl::has_internet ())
skip_if (!test_all)

test_that ("invalid key", {
    bbox <- get_bbox (c (-0.12, 51.51, -0.11, 51.52))
    expect_warning (
        suppressMessages (
            extract_osm_objects (bbox = bbox, key = "aaa")
        ),
        "No valid data returned"
    )
})

test_that ("valid key", {
    bbox <- get_bbox (c (-0.12, 51.518, -0.118, 51.52))
    dat <- extract_osm_objects (bbox = bbox, key = "building")
    expect_is (dat, "sf")
    dat <- extract_osm_objects (
        bbox = bbox, key = "building",
        sf = FALSE
    )
    expect_is (dat, "SpatialPolygonsDataFrame")
})

test_that ("extra_pairs", {
    key <- "route"
    value <- "bicycle"
    extra_pairs <- c ("name", "London Cycle Network")
    bbox <- get_bbox (c (0, 51.5, 0.1, 51.6))
    dat <- extract_osm_objects (
        bbox = bbox, key = key,
        value = value,
        extra_pairs = extra_pairs
    )
    expect_true (nrow (dat) > 0)
    expect_is (dat, "sf")
})

test_that ("sp objects", {
    key <- "route"
    value <- "bicycle"
    extra_pairs <- c ("name", "London Cycle Network")
    bbox <- get_bbox (c (0, 51.5, 0.1, 51.6))
    dat <- extract_osm_objects (
        bbox = bbox, key = key,
        value = value,
        extra_pairs = extra_pairs,
        sf = FALSE
    )
    expect_true (nrow (dat) > 0)
    expect_is (dat, "Spatial")
})
