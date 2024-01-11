import express from "express";
import { StatusCodes } from "http-status-codes";
import axios from "axios";

const api = 'https://api.jikan.moe/v4/characters';

//TODO: getCharacterFullById, getCharacterAnime, getCharacterVoiceActors, getCharacterPictures, getCharacterSearch