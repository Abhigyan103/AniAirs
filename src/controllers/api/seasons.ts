import express from "express";
import { StatusCodes } from "http-status-codes";
import axios from "axios";

const api = 'https://api.jikan.moe/v4/seasons';

//TODO: getSeasonsList, getSeasonNow, getSeason